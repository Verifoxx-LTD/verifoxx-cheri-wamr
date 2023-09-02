(module
    (import "env" "print_externref" (func $native-print-externref (param externref) (result i32)))
    (import "env" "get_externref" (func $native-get-externref (result externref)))
    (import "env" "put_externref" (func $native-put-externref (param externref) (result i32)))
    (import "env" "externref_call_wasm" (func $externref-call-wasm (param i32) (result i32)))

    (type $native-print-type (func (param externref) (result i32)))

    (func $myfunc (type $native-print-type) (param $extref externref) (result i32)
        (call $native-print-externref (local.get $extref))
        ;;(return (i32.const 7))
    )


    (memory $memory 1)
    (elem $elem_test_externref externref (ref.null extern) (ref.null extern))
    (elem $elem_test_funcref funcref (ref.func $myfunc))

    (table $testtab 2 externref)
    (table $testtabtwo 2 externref)
    (table $functab 1 funcref)

    (func $table_test_set (export "table_test_set") (param externref externref externref externref) (result i32)
        ;; Copy externrefs to table, growing it first
        ;; Return size of table

        (table.set $testtab (i32.const 0) (local.get 0))
        (table.set $testtab (i32.const 1) (local.get 1))
        (table.grow $testtab (ref.null extern) (i32.const 3))
        drop
        
        (table.set $testtab (i32.const 2) (local.get 2))
        (table.set $testtab (i32.const 3) (local.get 3))

        (table.size $testtab)
    )

    (func $table_test_null (export "table_test_null") (param i32) (result i32)
        (ref.is_null (table.get $testtab (local.get 0)) )
    )

    (func $table_test_ops (export "table_test_ops")
        ;; Get first element and fill into last element
        (table.fill $testtab (i32.const 4) (table.get $testtab (i32.const 0)) (i32.const 1))

        ;; Set testtabtwo to nulls from element
        (table.init $testtabtwo $elem_test_externref (i32.const 0) (i32.const 0) (i32.const 2))

        ;; Finished with so drop elem
        (elem.drop $elem_test_externref)

        ;;(table.set $testtabtwo (i32.const 0) (ref.null extern))
        ;;(table.set $testtabtwo (i32.const 1) (ref.null extern))

        ;; Copy first 2 fields of testtabtwo to testtab
        (table.copy $testtab $testtabtwo (i32.const 0) (i32.const 0) (i32.const 2))
    )

    (func $funcref_test (export "funcref_test") (param $extref externref) (result i32)
        ;; The below just ends up calling the native function to print a capability
        (table.init $functab $elem_test_funcref (i32.const 0) (i32.const 0) (i32.const 1))
        ;;(call_indirect $functab (type $native-print-type) (local.get $extref) (i32.const 0))
        (call $native-print-externref (local.get $extref))
    )

    (func $table_test_get (export "table_test_get") (param i32) (result externref)
        ;; Get given index of table
        ;; Return ref at that location

        (table.get $testtab (local.get 0))
    )

    (func $externref_test_in_wasm (export "externref_test_in_wasm") (param externref externref) (result externref)
        
        (call $native-print-externref (local.get 0))
        drop

        (call $native-print-externref (local.get 1))
        drop

        ;; take the first arg and call back to native to put it
        (call $native-put-externref (local.get 0))
        
        drop

        ;; Return the 2nd arg straight back again
        (local.get 1)
    )

    (func $do_cmdline_test (export "do_cmdline_test") (param $extref externref) (result externref)
        ;; Call a native test which will call back to WASM to "externref_test_in_wasm"

        ;; Send the passed in externref to native for print
        (call $native-print-externref (local.get $extref))
        drop    ;; Get rid of result

        ;; Get an extref handle and return as result
        (call $native-get-externref)
    )

    (func $main (export "main")
        ;; Call a native test which will call back to WASM to "externref_test_in_wasm"
        i32.const 0
        (call $externref-call-wasm)
        drop
    )        
)
