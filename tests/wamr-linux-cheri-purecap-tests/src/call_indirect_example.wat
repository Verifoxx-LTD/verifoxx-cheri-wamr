(module
  ;; Define a signature for the function (example is "int32 func(int32 param)")
  (type $myfunc_sig (func (param i32) (result i32)))    
  
  ;; Declare a function table, this is holding 1 entry.  Note that "anyfunc" deprecated, use "funcref" now
  (table $tbl 1 funcref)
  
  ;; Fill in the table (starting at index 0)
  (elem (i32.const 0) $myfunc)

  ;; Define a function which matches the function signature we defined
  ;; This example just returns the input paramter + 1
  (func $myfunc (type $myfunc_sig) (param $myvar i32) (result i32)
    (return (i32.add (local.get $myvar) (i32.const 1)))
  )
  
  ;; Do the call_indirect test (should return value of 101)
  (func $do_test (export "do_test") (result i32)
     (return (call_indirect (type $myfunc_sig)      ;; Signature
                            (i32.const 100)         ;; Parameters
                            (i32.const 0)           ;; Index of fn in table
              )
      )
  )
)
