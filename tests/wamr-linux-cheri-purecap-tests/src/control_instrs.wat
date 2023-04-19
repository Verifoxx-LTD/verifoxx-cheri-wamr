;; build with wat2wasm control_insts.wat -o control_insts.wasm
;; Usage: You need to call one of the specific functions and provide a numeric argument in most cases
;; Numeric argument defines the code path through the test and the string printed to stdout

;; Functions:
;; do_test_if 0|1
;; do_test_if_else 0|1
;; do_test_if_then 1|2|3
;; do_br
;; do_br_if 0|1|2|3

(module
  (import "env" "puts" (func $puts (param i32) (result i32)))
  (memory $memory 1)
  
  (global $str0 i32 (i32.const 0))
  (global $str1 i32 (i32.const 256))
  (global $str2 i32 (i32.const 512))
  (global $str3 i32 (i32.const 768))
  (global $str4 i32 (i32.const 1024))
  (global $strnone0 i32 (i32.const 1280))
  (global $strnotprinted i32 (i32.const 0x600))
  (global $strbranched i32 (i32.const 0x700))
  (global $strloop i32 (i32.const 0x800))
  
  (data (i32.const 0) "Case 0")
  (data (i32.const 256) "Case 1")
  (data (i32.const 512) "Case 2")
  (data (i32.const 768) "Case Not 1 or 2")
  (data (i32.const 1024) "Case 4")
  (data (i32.const 1280) "Case non-zero")
  (data (i32.const 0x600) "This should not be printed")
  (data (i32.const 0x700) "Code branched")
  (data (i32.const 0x800) "Code in loop")

  (func (export "do_test_if") (param $testvar i32)
    local.get $testvar
    if
       (call $puts (global.get $strnone0))
       drop
    end
  )
 
  (func (export "do_test_if_else") (param $testvar i32)
    local.get $testvar
    if
       (call $puts (global.get $strnone0))
       drop
    else
       (call $puts (global.get $str0))
       drop
    end
  )
    
  (func (export "do_test_if_then") (param $testvar i32)
    (if (i32.eq (local.get $testvar) (i32.const 1) )
      (then
          (call $puts (global.get $str1))
          drop
      )
      (else
          (if (i32.eq (local.get $testvar) (i32.const 2) )
		      (then
			      (call $puts (global.get $str2))
			      drop
		      )
		      (else
			      (call $puts (global.get $str3))
			      drop
		      )
	       )
	  )
    )
  )
  
  
  (func (export "do_br")
     (block $jump_end
        br $jump_end
        
        (call $puts (global.get $strnotprinted))
        drop
                
     )
     
     (call $puts (global.get $strbranched))
     drop
     
     (loop $jump_start
          (call $puts (global.get $strloop))
          drop
     )
     nop
  )

  (func (export "do_br_if") (param $testvar i32)
     (block $skip_branched
	    (block $jump_end
	  	    (br_if $jump_end (i32.eq (local.get $testvar) (i32.const 1)))
		    (br_if $jump_end (i32.eq (local.get $testvar) (i32.const 2)))
		    (call $puts (global.get $str3))
		    drop
		    br $skip_branched       
	    )
	    (call $puts (global.get $strbranched))
        drop
     )
     
     (loop $jump_start
          (call $puts (global.get $strloop))
          drop
          local.get $testvar
          i32.const 1
          i32.sub
          local.tee $testvar
          i32.const 0
          i32.gt_s
          br_if $jump_start 
     )
  )
)
