;; build with wat2wasm control_insts.wat -o control_insts.wasm
;; Usage: You need to call one of the specific functions and provide a numeric argument in most cases
;; Numeric argument defines the code path through the test and the string printed to stdout

;; Functions:
;; do_test_if 0|1
;; do_test_if_else 0|1
;; do_test_if_then 1|2|3
;; do_br
;; do_br_if 0|1|2|3
;; do_br_table 0|1|2|3
;;  - note: do_br_table returns 1 if entered a handled case, 0 if went to default

;; To run all the tests, execute function main() or run through WAMR with no function (will default to main)

(module
  (import "env" "puts" (func $puts (param i32) (result i32)))
  (type $functest_sig (func (param i32) (result i32)))
  (table $tbl 1 funcref)    ;; Note: anyfunc changed to funcref now
  (elem (i32.const 0) $call_indirect_test)
  (memory $memory 1)
  
  (global $str0 i32 (i32.const 0x000))
  (global $str1 i32 (i32.const 0x100))
  (global $str2 i32 (i32.const 0x200))
  (global $str3 i32 (i32.const 0x300))
  (global $str4 i32 (i32.const 0x400))
  (global $strnone0 i32 (i32.const 0x500))
  (global $strnotprinted i32 (i32.const 0x600))
  (global $strbranched i32 (i32.const 0x700))
  (global $strloop i32 (i32.const 0x800))
  (global $strdefault i32 (i32.const 0x900))
  (global $strdoindirect i32 (i32.const 0xa00))
  (global $outerstrloop i32 (i32.const 0xb00))
  
  (data (i32.const 0x000) "Case 0")
  (data (i32.const 0x100) "Case 1")
  (data (i32.const 0x200) "Case 2")
  (data (i32.const 0x300) "Case Not 1 or 2")
  (data (i32.const 0x400) "Case 4")
  (data (i32.const 0x500) "Case non-zero")
  (data (i32.const 0x600) "This should not be printed")
  (data (i32.const 0x700) "Code branched")
  (data (i32.const 0x800) "Code in loop")
  (data (i32.const 0x900) "Case default")
  (data (i32.const 0xa00) "Do indirect test calls indirect mult(testvar*2) and returns the result")
  (data (i32.const 0xb00) "Code in outer loop")
  
  (func $do_test_if (export "do_test_if") (param $testvar i32)
    local.get $testvar
    if
       (call $puts (global.get $strnone0))
       drop
    end
  )
 
  (func $do_test_if_else (export "do_test_if_else") (param $testvar i32)
    local.get $testvar
    if
       (call $puts (global.get $strnone0))
       drop
    else
       (call $puts (global.get $str0))
       drop
    end
  )
    
  (func $do_test_if_then (export "do_test_if_then") (param $testvar i32)
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
  
  
  (func $do_br (export "do_br")
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

  (func $do_br_if (export "do_br_if") (param $testvar i32)
     (local $loopouter i32)
     (local $loopinner i32)
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

     local.get $testvar
     local.set $loopouter
     (loop $outer_jump_start
         (call $puts (global.get $outerstrloop))
         drop
         local.get $testvar
         local.set $loopinner
         (loop $jump_start
              (call $puts (global.get $strloop))
              drop
              local.get $loopinner
              i32.const 1
              i32.sub
              local.tee $loopinner
              i32.const 0
              i32.gt_s
              br_if $jump_start 
         )
         local.get $loopouter
         i32.const 1
         i32.sub
         local.tee $loopouter
         i32.const 0
         i32.gt_s
         br_if $outer_jump_start
     )
  )

  ;; Returns 1 if handled case, 0 if went to default
  (func $do_br_table (export "do_br_table") (param $testvar i32) (result i32)
     (block $case0
      (block $case1
       (block $case2
        (block $casedefault
         (br_table $case0 $case1 $case2 $casedefault (local.get $testvar))
        )
        (call $puts (global.get $strdefault))
        drop
        i32.const 0
        return
       )
       (call $puts (global.get $str2))
       drop
       i32.const 1
       return
      )
      (call $puts (global.get $str1))
      drop
      i32.const 1
      return
     )
     (call $puts (global.get $str0))
     drop
     i32.const 1
     return
  )

  (func $call_indirect_test (type $functest_sig) (param $testvar i32) (result i32)
    (local.get $testvar)
    i32.const 2
    i32.mul
    return
  )
  
  (func $do_call_indirect (export "do_call_indirect") (param $testvar i32) (result i32)

     (call $puts (global.get $strdoindirect))
     drop
     (call_indirect (type $functest_sig) (local.get $testvar) (i32.const 0))    ;; 0 is index into table
     return
  )
  
  
  
  (func $main (export "main")
    i32.const 0
    call $do_test_if
    i32.const 1
    call $do_test_if
    
    i32.const 0
    call $do_test_if_else
    i32.const 1
    call $do_test_if_else

    i32.const 1
    call $do_test_if_then
    i32.const 2
    call $do_test_if_then
    i32.const 3
    call $do_test_if_then

    call $do_br
    
    i32.const 0
    call $do_br_if
    i32.const 1
    call $do_br_if
    i32.const 2
    call $do_br_if

    i32.const 0
    call $do_br_table
    drop
    i32.const 1
    call $do_br_table
    drop
    i32.const 2
    call $do_br_table
    drop
    i32.const 3
    call $do_br_table
    drop
    i32.const 10
    call $do_call_indirect
    drop
  )
)
