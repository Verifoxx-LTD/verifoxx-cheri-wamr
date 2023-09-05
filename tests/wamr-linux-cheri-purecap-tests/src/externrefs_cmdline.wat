(module
    (import "wasi_snapshot_preview1" "proc_exit" (func $wasi-proc-exit (param i32)))
    (import "env" "get_externref" (func $native-get-externref (result externref)))
    (import "env" "put_externref" (func $native-put-externref (param externref) (result i32)))

    ;; We use a WASI function so export memory
    (memory $memory (export "memory") 2)

    ;; do-test: Simple command line test to take externrefs (not capabilities) and return one of them
    ;; Given idx = 1, 2 or other
    ;; Return first extref if idx == 1, 2nd if idx == 2 else return null extref
    (func $do-test (export "do_test") (param $idx i32) (param $ext1 externref) (param $ext2 externref) (result externref)
        (i32.eq (local.get $idx) (i32.const 1))
        (if 
            (then
                (local.get $ext1)
                return
            )
        )
        (i32.eq (local.get $idx) (i32.const 2))
        (if 
            (then
                (local.get $ext2)
                return
            )
        )

        (ref.null extern)
        return
    )

    ;; main: Gets an externref from native lib, returns value and native will check is the same
    (func $main (export "_start")
        (call $native-get-externref)
        (call $native-put-externref)
        (call $wasi-proc-exit)
        (unreachable)
    )
)
