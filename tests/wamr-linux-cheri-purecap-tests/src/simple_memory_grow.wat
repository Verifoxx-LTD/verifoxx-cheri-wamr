(module
    (import "wasi_snapshot_preview1" "proc_exit" (func $wasi-proc-exit (param i32)))

    ;; Export some memory
    (memory $memory (export "memory") 1)

    ;; main: Perform the memory grow
    (func $main (export "_start")
        (memory.grow (i32.const 2))
        (call $wasi-proc-exit)
        (unreachable)
    )
)

