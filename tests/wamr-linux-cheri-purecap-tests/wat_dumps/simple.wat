(module
  (type $t0 (func (param i32)))
  (type $t1 (func))
  (type $t2 (func (param i32 i32) (result i32)))
  (type $t3 (func (result i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type $t0)))
  (func $_start (type $t1)
    (local $l0 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.tee $l0
            (call $__original_main))))
      (call $exit
        (local.get $l0))
      (unreachable)))
  (func $add (type $t2) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (local.set $l2
      (global.get $__stack_pointer))
    (local.set $l3
      (i32.const 16))
    (local.set $l4
      (i32.sub
        (local.get $l2)
        (local.get $l3)))
    (i32.store offset=12
      (local.get $l4)
      (local.get $p0))
    (i32.store offset=8
      (local.get $l4)
      (local.get $p1))
    (local.set $l5
      (i32.load offset=12
        (local.get $l4)))
    (local.set $l6
      (i32.load offset=8
        (local.get $l4)))
    (local.set $l7
      (i32.add
        (local.get $l5)
        (local.get $l6)))
    (return
      (local.get $l7)))
  (func $__original_main (type $t3) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32)
    (local.set $l0
      (global.get $__stack_pointer))
    (local.set $l1
      (i32.const 16))
    (local.set $l2
      (i32.sub
        (local.get $l0)
        (local.get $l1)))
    (global.set $__stack_pointer
      (local.get $l2))
    (local.set $l3
      (i32.const 0))
    (i32.store offset=12
      (local.get $l2)
      (local.get $l3))
    (local.set $l4
      (i32.const 1))
    (local.set $l5
      (i32.const 2))
    (local.set $l6
      (call $add
        (local.get $l4)
        (local.get $l5)))
    (local.set $l7
      (i32.const 16))
    (local.set $l8
      (i32.add
        (local.get $l2)
        (local.get $l7)))
    (global.set $__stack_pointer
      (local.get $l8))
    (return
      (local.get $l6)))
  (func $__wasi_proc_exit (type $t0) (param $p0 i32)
    (call $__imported_wasi_snapshot_preview1_proc_exit
      (local.get $p0))
    (unreachable))
  (func $_Exit (type $t0) (param $p0 i32)
    (call $__wasi_proc_exit
      (local.get $p0))
    (unreachable))
  (func $dummy (type $t1))
  (func $__wasm_call_dtors (type $t1)
    (call $dummy)
    (call $dummy))
  (func $exit (type $t0) (param $p0 i32)
    (call $dummy)
    (call $dummy)
    (call $_Exit
      (local.get $p0))
    (unreachable))
  (func $_start.command_export (export "_start") (type $t1)
    (call $_start)
    (call $__wasm_call_dtors))
  (table $T0 1 1 funcref)
  (memory $memory (export "memory") 2)
  (global $__stack_pointer (mut i32) (i32.const 66560)))
