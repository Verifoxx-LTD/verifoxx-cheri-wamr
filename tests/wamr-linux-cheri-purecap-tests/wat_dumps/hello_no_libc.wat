(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (import "wasi_unstable" "fd_write" (func $__wasi_fd_write (type 0)))
  (func $print (type 1) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store
    i32.const 0
    local.set 2
    loop  ;; label = @1
      local.get 0
      local.get 2
      i32.add
      local.set 3
      local.get 2
      i32.const 1
      i32.add
      local.tee 4
      local.set 2
      local.get 3
      i32.load8_u
      br_if 0 (;@1;)
    end
    local.get 1
    local.get 4
    i32.const -1
    i32.add
    i32.store offset=4
    i32.const 1
    local.get 1
    i32.const 1
    local.get 1
    i32.const 12
    i32.add
    call $__wasi_fd_write
    drop
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_start (type 2)
    i32.const 1024
    call $print)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 66576))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (data $.rodata (i32.const 1024) "Hello WAMR!\0a\00"))
