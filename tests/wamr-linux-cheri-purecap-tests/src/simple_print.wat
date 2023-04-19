;; build with wat2wasm simple_print.wat -o simple_print.wasm

(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func))
  (import "wasi_unstable" "fd_write" (func $__wasi_fd_write (type 0)))
  (func $_start (type 1)
    i32.const 12
    i32.const 7
    i32.store
    i32.const 8
    i32.const 1024
    i32.store
    i32.const 1
    i32.const 8
    i32.const 1
    i32.const 0
    call $__wasi_fd_write
    drop
  )
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 66576))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (data $.rodata (i32.const 1024) "TESTING\00"))
