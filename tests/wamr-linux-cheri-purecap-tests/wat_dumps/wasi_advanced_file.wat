(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i64 i32) (result i64)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i64 i64) (result i32)))
  (type (;5;) (func (param i32 i64) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i64 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (type (;11;) (func (param i32)))
  (type (;12;) (func))
  (type (;13;) (func (param i32 i32 i32 i64) (result i32)))
  (type (;14;) (func (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (type (;16;) (func (param i32 i32 i32 i32)))
  (type (;17;) (func (param i32 i32 i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32)))
  (type (;19;) (func (param f64 i32) (result f64)))
  (import "wasi_snapshot_preview1" "args_get" (func $__imported_wasi_snapshot_preview1_args_get (type 3)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $__imported_wasi_snapshot_preview1_args_sizes_get (type 3)))
  (import "wasi_snapshot_preview1" "fd_allocate" (func $__imported_wasi_snapshot_preview1_fd_allocate (type 4)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__imported_wasi_snapshot_preview1_fd_close (type 0)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func $__imported_wasi_snapshot_preview1_fd_fdstat_get (type 3)))
  (import "wasi_snapshot_preview1" "fd_fdstat_set_flags" (func $__imported_wasi_snapshot_preview1_fd_fdstat_set_flags (type 3)))
  (import "wasi_snapshot_preview1" "fd_filestat_get" (func $__imported_wasi_snapshot_preview1_fd_filestat_get (type 3)))
  (import "wasi_snapshot_preview1" "fd_filestat_set_size" (func $__imported_wasi_snapshot_preview1_fd_filestat_set_size (type 5)))
  (import "wasi_snapshot_preview1" "fd_pread" (func $__imported_wasi_snapshot_preview1_fd_pread (type 6)))
  (import "wasi_snapshot_preview1" "fd_prestat_get" (func $__imported_wasi_snapshot_preview1_fd_prestat_get (type 3)))
  (import "wasi_snapshot_preview1" "fd_prestat_dir_name" (func $__imported_wasi_snapshot_preview1_fd_prestat_dir_name (type 2)))
  (import "wasi_snapshot_preview1" "fd_pwrite" (func $__imported_wasi_snapshot_preview1_fd_pwrite (type 6)))
  (import "wasi_snapshot_preview1" "fd_read" (func $__imported_wasi_snapshot_preview1_fd_read (type 7)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__imported_wasi_snapshot_preview1_fd_seek (type 8)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__imported_wasi_snapshot_preview1_fd_write (type 7)))
  (import "wasi_snapshot_preview1" "path_create_directory" (func $__imported_wasi_snapshot_preview1_path_create_directory (type 2)))
  (import "wasi_snapshot_preview1" "path_filestat_get" (func $__imported_wasi_snapshot_preview1_path_filestat_get (type 9)))
  (import "wasi_snapshot_preview1" "path_open" (func $__imported_wasi_snapshot_preview1_path_open (type 10)))
  (import "wasi_snapshot_preview1" "path_remove_directory" (func $__imported_wasi_snapshot_preview1_path_remove_directory (type 2)))
  (import "wasi_snapshot_preview1" "path_unlink_file" (func $__imported_wasi_snapshot_preview1_path_unlink_file (type 2)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 11)))
  (func $__wasm_call_ctors (type 12)
    call $__wasilibc_populate_preopens)
  (func $undefined_weak:__wasilibc_find_relpath_alloc (type 9) (param i32 i32 i32 i32 i32) (result i32)
    unreachable)
  (func $_start (type 12)
    (local i32)
    block  ;; label = @1
      call $__main_void
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $exit
      unreachable
    end)
  (func $main (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i64 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 1600
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    i32.const 0
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=1596
    local.get 4
    local.get 0
    i32.store offset=1592
    local.get 4
    local.get 1
    i32.store offset=1588
    i32.const 1661
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=1580
    i32.const 1069
    local.set 7
    i32.const 777
    local.set 8
    local.get 7
    local.get 8
    call $mkdir
    local.set 9
    local.get 4
    local.get 9
    i32.store offset=572
    local.get 4
    i32.load offset=572
    local.set 10
    block  ;; label = @1
      local.get 10
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=572
      local.set 11
      i32.const -1
      local.set 12
      local.get 11
      local.set 13
      local.get 12
      local.set 14
      local.get 13
      local.get 14
      i32.eq
      local.set 15
      i32.const 1
      local.set 16
      local.get 15
      local.get 16
      i32.and
      local.set 17
      block  ;; label = @2
        local.get 17
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 18
        local.get 18
        i32.load offset=5696
        local.set 19
        i32.const 20
        local.set 20
        local.get 19
        local.set 21
        local.get 20
        local.set 22
        local.get 21
        local.get 22
        i32.eq
        local.set 23
        i32.const 1
        local.set 24
        local.get 23
        local.get 24
        i32.and
        local.set 25
        local.get 25
        br_if 1 (;@1;)
      end
      i32.const 1618
      local.set 26
      i32.const 1150
      local.set 27
      i32.const 39
      local.set 28
      i32.const 1113
      local.set 29
      local.get 26
      local.get 27
      local.get 28
      local.get 29
      call $__assert_fail
      unreachable
    end
    i32.const 2706
    local.set 30
    i32.const 0
    local.set 31
    local.get 30
    local.get 31
    call $printf
    drop
    i32.const 1053
    local.set 32
    i32.const 1555
    local.set 33
    local.get 32
    local.get 33
    call $fopen
    local.set 34
    local.get 4
    local.get 34
    i32.store offset=1584
    local.get 4
    i32.load offset=1584
    local.set 35
    i32.const 0
    local.set 36
    local.get 35
    local.set 37
    local.get 36
    local.set 38
    local.get 37
    local.get 38
    i32.eq
    local.set 39
    i32.const 1
    local.set 40
    local.get 39
    local.get 40
    i32.and
    local.set 41
    block  ;; label = @1
      local.get 41
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 42
      local.get 42
      i32.load offset=5696
      local.set 43
      local.get 4
      local.get 43
      i32.store offset=384
      i32.const 1740
      local.set 44
      i32.const 384
      local.set 45
      local.get 4
      local.get 45
      i32.add
      local.set 46
      local.get 44
      local.get 46
      call $printf
      drop
    end
    local.get 4
    i32.load offset=1584
    local.set 47
    i32.const 0
    local.set 48
    local.get 47
    local.set 49
    local.get 48
    local.set 50
    local.get 49
    local.get 50
    i32.ne
    local.set 51
    i32.const 1
    local.set 52
    local.get 51
    local.get 52
    i32.and
    local.set 53
    block  ;; label = @1
      local.get 53
      br_if 0 (;@1;)
      i32.const 1206
      local.set 54
      i32.const 1150
      local.set 55
      i32.const 47
      local.set 56
      i32.const 1113
      local.set 57
      local.get 54
      local.get 55
      local.get 56
      local.get 57
      call $__assert_fail
      unreachable
    end
    i32.const 2111
    local.set 58
    i32.const 0
    local.set 59
    local.get 58
    local.get 59
    call $printf
    drop
    i32.const 2543
    local.set 60
    i32.const 0
    local.set 61
    local.get 60
    local.get 61
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 62
    local.get 4
    i32.load offset=1580
    local.set 63
    local.get 4
    local.get 63
    i32.store offset=368
    i32.const 1076
    local.set 64
    i32.const 368
    local.set 65
    local.get 4
    local.get 65
    i32.add
    local.set 66
    local.get 62
    local.get 64
    local.get 66
    call $fprintf
    local.set 67
    local.get 4
    local.get 67
    i32.store offset=572
    local.get 4
    i32.load offset=572
    local.set 68
    local.get 4
    i32.load offset=1580
    local.set 69
    local.get 69
    call $strlen
    local.set 70
    local.get 68
    local.set 71
    local.get 70
    local.set 72
    local.get 71
    local.get 72
    i32.eq
    local.set 73
    i32.const 1
    local.set 74
    local.get 73
    local.get 74
    i32.and
    local.set 75
    block  ;; label = @1
      local.get 75
      br_if 0 (;@1;)
      i32.const 1558
      local.set 76
      i32.const 1150
      local.set 77
      i32.const 53
      local.set 78
      i32.const 1113
      local.set 79
      local.get 76
      local.get 77
      local.get 78
      local.get 79
      call $__assert_fail
      unreachable
    end
    i32.const 2082
    local.set 80
    i32.const 0
    local.set 81
    local.get 80
    local.get 81
    call $printf
    drop
    i32.const 2591
    local.set 82
    i32.const 0
    local.set 83
    local.get 82
    local.get 83
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 84
    i32.const 0
    local.set 85
    local.get 84
    local.get 85
    local.get 85
    call $fseek
    local.set 86
    local.get 4
    local.get 86
    i32.store offset=572
    local.get 4
    i32.load offset=572
    local.set 87
    block  ;; label = @1
      local.get 87
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1434
      local.set 88
      i32.const 1150
      local.set 89
      i32.const 59
      local.set 90
      i32.const 1113
      local.set 91
      local.get 88
      local.get 89
      local.get 90
      local.get 91
      call $__assert_fail
      unreachable
    end
    i32.const 2368
    local.set 92
    i32.const 0
    local.set 93
    local.get 92
    local.get 93
    call $printf
    drop
    i32.const 576
    local.set 94
    local.get 4
    local.get 94
    i32.add
    local.set 95
    local.get 95
    local.set 96
    local.get 4
    i32.load offset=1584
    local.set 97
    i32.const 1
    local.set 98
    i32.const 1000
    local.set 99
    local.get 96
    local.get 98
    local.get 99
    local.get 97
    call $fread
    drop
    i32.const 576
    local.set 100
    local.get 4
    local.get 100
    i32.add
    local.set 101
    local.get 101
    local.set 102
    local.get 4
    local.get 102
    i32.store offset=352
    i32.const 1675
    local.set 103
    i32.const 352
    local.set 104
    local.get 4
    local.get 104
    i32.add
    local.set 105
    local.get 103
    local.get 105
    call $printf
    drop
    local.get 4
    i32.load offset=1580
    local.set 106
    i32.const 576
    local.set 107
    local.get 4
    local.get 107
    i32.add
    local.set 108
    local.get 108
    local.set 109
    local.get 4
    i32.load offset=1580
    local.set 110
    local.get 110
    call $strlen
    local.set 111
    local.get 106
    local.get 109
    local.get 111
    call $strncmp
    local.set 112
    block  ;; label = @1
      local.get 112
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1497
      local.set 113
      i32.const 1150
      local.set 114
      i32.const 64
      local.set 115
      i32.const 1113
      local.set 116
      local.get 113
      local.get 114
      local.get 115
      local.get 116
      call $__assert_fail
      unreachable
    end
    i32.const 2140
    local.set 117
    i32.const 0
    local.set 118
    local.get 117
    local.get 118
    call $printf
    drop
    i32.const 2637
    local.set 119
    i32.const 0
    local.set 120
    local.get 119
    local.get 120
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 121
    local.get 121
    call $feof
    local.set 122
    local.get 4
    local.get 122
    i32.store offset=556
    local.get 4
    i32.load offset=556
    local.set 123
    local.get 4
    local.get 123
    i32.store offset=336
    i32.const 1716
    local.set 124
    i32.const 336
    local.set 125
    local.get 4
    local.get 125
    i32.add
    local.set 126
    local.get 124
    local.get 126
    call $printf
    drop
    local.get 4
    i32.load offset=556
    local.set 127
    i32.const 1
    local.set 128
    local.get 127
    local.set 129
    local.get 128
    local.set 130
    local.get 129
    local.get 130
    i32.eq
    local.set 131
    i32.const 1
    local.set 132
    local.get 131
    local.get 132
    i32.and
    local.set 133
    block  ;; label = @1
      local.get 133
      br_if 0 (;@1;)
      i32.const 1414
      local.set 134
      i32.const 1150
      local.set 135
      i32.const 71
      local.set 136
      i32.const 1113
      local.set 137
      local.get 134
      local.get 135
      local.get 136
      local.get 137
      call $__assert_fail
      unreachable
    end
    i32.const 2044
    local.set 138
    i32.const 0
    local.set 139
    local.get 138
    local.get 139
    call $printf
    drop
    i32.const 2513
    local.set 140
    i32.const 0
    local.set 141
    local.get 140
    local.get 141
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 142
    local.get 142
    call $ftell
    local.set 143
    local.get 4
    local.get 143
    i32.store offset=552
    local.get 4
    i32.load offset=552
    local.set 144
    local.get 4
    local.get 144
    i32.store offset=320
    i32.const 1889
    local.set 145
    i32.const 320
    local.set 146
    local.get 4
    local.get 146
    i32.add
    local.set 147
    local.get 145
    local.get 147
    call $printf
    drop
    local.get 4
    i32.load offset=552
    local.set 148
    i32.const 13
    local.set 149
    local.get 148
    local.set 150
    local.get 149
    local.set 151
    local.get 150
    local.get 151
    i32.eq
    local.set 152
    i32.const 1
    local.set 153
    local.get 152
    local.get 153
    i32.and
    local.set 154
    block  ;; label = @1
      local.get 154
      br_if 0 (;@1;)
      i32.const 1393
      local.set 155
      i32.const 1150
      local.set 156
      i32.const 78
      local.set 157
      i32.const 1113
      local.set 158
      local.get 155
      local.get 156
      local.get 157
      local.get 158
      call $__assert_fail
      unreachable
    end
    i32.const 1917
    local.set 159
    i32.const 0
    local.set 160
    local.get 159
    local.get 160
    call $printf
    drop
    i32.const 2456
    local.set 161
    i32.const 0
    local.set 162
    local.get 161
    local.get 162
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 163
    local.get 163
    call $fflush
    local.set 164
    local.get 4
    local.get 164
    i32.store offset=572
    local.get 4
    i32.load offset=572
    local.set 165
    block  ;; label = @1
      local.get 165
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1434
      local.set 166
      i32.const 1150
      local.set 167
      i32.const 84
      local.set 168
      i32.const 1113
      local.set 169
      local.get 166
      local.get 167
      local.get 168
      local.get 169
      call $__assert_fail
      unreachable
    end
    i32.const 1917
    local.set 170
    i32.const 0
    local.set 171
    local.get 170
    local.get 171
    call $printf
    drop
    i32.const 7
    local.set 172
    local.get 4
    local.get 172
    i32.store offset=288
    i32.const 2843
    local.set 173
    i32.const 288
    local.set 174
    local.get 4
    local.get 174
    i32.add
    local.set 175
    local.get 173
    local.get 175
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 176
    local.get 176
    call $fileno
    local.set 177
    i32.const 1079
    local.set 178
    i32.const 5
    local.set 179
    i64.const 7
    local.set 180
    local.get 177
    local.get 178
    local.get 179
    local.get 180
    call $pwrite
    local.set 181
    local.get 4
    local.get 181
    i32.store offset=572
    local.get 4
    i32.load offset=1584
    local.set 182
    local.get 182
    call $ftell
    local.set 183
    local.get 4
    local.get 183
    i32.store offset=304
    i32.const 1690
    local.set 184
    i32.const 304
    local.set 185
    local.get 4
    local.get 185
    i32.add
    local.set 186
    local.get 184
    local.get 186
    call $printf
    drop
    local.get 4
    i32.load offset=572
    local.set 187
    i32.const 5
    local.set 188
    local.get 187
    local.set 189
    local.get 188
    local.set 190
    local.get 189
    local.get 190
    i32.eq
    local.set 191
    i32.const 1
    local.set 192
    local.get 191
    local.get 192
    i32.and
    local.set 193
    block  ;; label = @1
      local.get 193
      br_if 0 (;@1;)
      i32.const 1175
      local.set 194
      i32.const 1150
      local.set 195
      i32.const 92
      local.set 196
      i32.const 1113
      local.set 197
      local.get 194
      local.get 195
      local.get 196
      local.get 197
      call $__assert_fail
      unreachable
    end
    local.get 4
    i32.load offset=1584
    local.set 198
    local.get 198
    call $ftell
    local.set 199
    i32.const 13
    local.set 200
    local.get 199
    local.set 201
    local.get 200
    local.set 202
    local.get 201
    local.get 202
    i32.eq
    local.set 203
    i32.const 1
    local.set 204
    local.get 203
    local.get 204
    i32.and
    local.set 205
    block  ;; label = @1
      local.get 205
      br_if 0 (;@1;)
      i32.const 1585
      local.set 206
      i32.const 1150
      local.set 207
      i32.const 93
      local.set 208
      i32.const 1113
      local.set 209
      local.get 206
      local.get 207
      local.get 208
      local.get 209
      call $__assert_fail
      unreachable
    end
    i32.const 1956
    local.set 210
    i32.const 0
    local.set 211
    local.get 210
    local.get 211
    call $printf
    drop
    i32.const 7
    local.set 212
    local.get 4
    local.get 212
    i32.store offset=244
    i32.const 5
    local.set 213
    local.get 4
    local.get 213
    i32.store offset=240
    i32.const 2804
    local.set 214
    i32.const 240
    local.set 215
    local.get 4
    local.get 215
    i32.add
    local.set 216
    local.get 214
    local.get 216
    call $printf
    drop
    i32.const 0
    local.set 217
    local.get 4
    local.get 217
    i32.store8 offset=581
    local.get 4
    i32.load offset=1584
    local.set 218
    local.get 218
    call $fileno
    local.set 219
    i32.const 576
    local.set 220
    local.get 4
    local.get 220
    i32.add
    local.set 221
    local.get 221
    local.set 222
    i32.const 5
    local.set 223
    i64.const 7
    local.set 224
    local.get 219
    local.get 222
    local.get 223
    local.get 224
    call $pread
    drop
    i32.const 576
    local.set 225
    local.get 4
    local.get 225
    i32.add
    local.set 226
    local.get 226
    local.set 227
    local.get 4
    local.get 227
    i32.store offset=256
    i32.const 1675
    local.set 228
    i32.const 256
    local.set 229
    local.get 4
    local.get 229
    i32.add
    local.set 230
    local.get 228
    local.get 230
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 231
    local.get 231
    call $ftell
    local.set 232
    local.get 4
    local.get 232
    i32.store offset=272
    i32.const 1690
    local.set 233
    i32.const 272
    local.set 234
    local.get 4
    local.get 234
    i32.add
    local.set 235
    local.get 233
    local.get 235
    call $printf
    drop
    i32.const 576
    local.set 236
    local.get 4
    local.get 236
    i32.add
    local.set 237
    local.get 237
    local.set 238
    i32.const 1079
    local.set 239
    local.get 239
    local.get 238
    call $strcmp
    local.set 240
    block  ;; label = @1
      local.get 240
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1443
      local.set 241
      i32.const 1150
      local.set 242
      i32.const 103
      local.set 243
      i32.const 1113
      local.set 244
      local.get 241
      local.get 242
      local.get 243
      local.get 244
      call $__assert_fail
      unreachable
    end
    local.get 4
    i32.load offset=1584
    local.set 245
    local.get 245
    call $ftell
    local.set 246
    i32.const 13
    local.set 247
    local.get 246
    local.set 248
    local.get 247
    local.set 249
    local.get 248
    local.get 249
    i32.eq
    local.set 250
    i32.const 1
    local.set 251
    local.get 250
    local.get 251
    i32.and
    local.set 252
    block  ;; label = @1
      local.get 252
      br_if 0 (;@1;)
      i32.const 1585
      local.set 253
      i32.const 1150
      local.set 254
      i32.const 104
      local.set 255
      i32.const 1113
      local.set 256
      local.get 253
      local.get 254
      local.get 255
      local.get 256
      call $__assert_fail
      unreachable
    end
    i32.const 2000
    local.set 257
    i32.const 0
    local.set 258
    local.get 257
    local.get 258
    call $printf
    drop
    i32.const 2880
    local.set 259
    i32.const 0
    local.set 260
    local.get 259
    local.get 260
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 261
    local.get 261
    call $ftell
    local.set 262
    local.get 4
    local.get 262
    i32.store offset=208
    i32.const 1690
    local.set 263
    i32.const 208
    local.set 264
    local.get 4
    local.get 264
    i32.add
    local.set 265
    local.get 263
    local.get 265
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 266
    i32.const 0
    local.set 267
    local.get 266
    local.get 267
    local.get 267
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 268
    local.get 268
    call $ftell
    local.set 269
    local.get 4
    local.get 269
    i32.store offset=224
    i32.const 1690
    local.set 270
    i32.const 224
    local.set 271
    local.get 4
    local.get 271
    i32.add
    local.set 272
    local.get 270
    local.get 272
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 273
    local.get 273
    call $ftell
    local.set 274
    block  ;; label = @1
      local.get 274
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1480
      local.set 275
      i32.const 1150
      local.set 276
      i32.const 112
      local.set 277
      i32.const 1113
      local.set 278
      local.get 275
      local.get 276
      local.get 277
      local.get 278
      call $__assert_fail
      unreachable
    end
    i32.const 2963
    local.set 279
    i32.const 0
    local.set 280
    local.get 279
    local.get 280
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 281
    local.get 281
    call $ftell
    local.set 282
    local.get 4
    local.get 282
    i32.store offset=176
    i32.const 1690
    local.set 283
    i32.const 176
    local.set 284
    local.get 4
    local.get 284
    i32.add
    local.set 285
    local.get 283
    local.get 285
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 286
    i32.const 0
    local.set 287
    i32.const 2
    local.set 288
    local.get 286
    local.get 287
    local.get 288
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 289
    local.get 289
    call $ftell
    local.set 290
    local.get 4
    local.get 290
    i32.store offset=192
    i32.const 1690
    local.set 291
    i32.const 192
    local.set 292
    local.get 4
    local.get 292
    i32.add
    local.set 293
    local.get 291
    local.get 293
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 294
    local.get 294
    call $ftell
    local.set 295
    i32.const 13
    local.set 296
    local.get 295
    local.set 297
    local.get 296
    local.set 298
    local.get 297
    local.get 298
    i32.eq
    local.set 299
    i32.const 1
    local.set 300
    local.get 299
    local.get 300
    i32.and
    local.set 301
    block  ;; label = @1
      local.get 301
      br_if 0 (;@1;)
      i32.const 1585
      local.set 302
      i32.const 1150
      local.set 303
      i32.const 119
      local.set 304
      i32.const 1113
      local.set 305
      local.get 302
      local.get 303
      local.get 304
      local.get 305
      call $__assert_fail
      unreachable
    end
    local.get 4
    i32.load offset=1584
    local.set 306
    local.get 306
    call $ftell
    local.set 307
    i32.const 2
    local.set 308
    local.get 307
    local.get 308
    i32.div_s
    local.set 309
    local.get 4
    local.get 309
    i32.store offset=548
    i32.const 2921
    local.set 310
    i32.const 0
    local.set 311
    local.get 310
    local.get 311
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 312
    local.get 312
    call $ftell
    local.set 313
    local.get 4
    local.get 313
    i32.store offset=144
    i32.const 1690
    local.set 314
    i32.const 144
    local.set 315
    local.get 4
    local.get 315
    i32.add
    local.set 316
    local.get 314
    local.get 316
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 317
    i32.const 0
    local.set 318
    local.get 317
    local.get 318
    local.get 318
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 319
    local.get 4
    i32.load offset=548
    local.set 320
    i32.const 1
    local.set 321
    local.get 319
    local.get 320
    local.get 321
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 322
    local.get 322
    call $ftell
    local.set 323
    local.get 4
    local.get 323
    i32.store offset=160
    i32.const 1690
    local.set 324
    i32.const 160
    local.set 325
    local.get 4
    local.get 325
    i32.add
    local.set 326
    local.get 324
    local.get 326
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 327
    local.get 327
    call $ftell
    local.set 328
    local.get 4
    i32.load offset=548
    local.set 329
    local.get 328
    local.set 330
    local.get 329
    local.set 331
    local.get 330
    local.get 331
    i32.eq
    local.set 332
    i32.const 1
    local.set 333
    local.get 332
    local.get 333
    i32.and
    local.set 334
    block  ;; label = @1
      local.get 334
      br_if 0 (;@1;)
      i32.const 1085
      local.set 335
      i32.const 1150
      local.set 336
      i32.const 128
      local.set 337
      i32.const 1113
      local.set 338
      local.get 335
      local.get 336
      local.get 337
      local.get 338
      call $__assert_fail
      unreachable
    end
    i32.const 3002
    local.set 339
    i32.const 0
    local.set 340
    local.get 339
    local.get 340
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 341
    i32.const 0
    local.set 342
    i32.const 2
    local.set 343
    local.get 341
    local.get 342
    local.get 343
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 344
    local.get 344
    call $fileno
    local.set 345
    local.get 4
    i32.load offset=1584
    local.set 346
    local.get 346
    call $ftell
    local.set 347
    local.get 347
    local.set 348
    local.get 348
    i64.extend_i32_s
    local.set 349
    i64.const 1048576
    local.set 350
    local.get 345
    local.get 349
    local.get 350
    call $posix_fallocate
    drop
    local.get 4
    i32.load offset=1584
    local.set 351
    local.get 351
    call $ftell
    local.set 352
    local.get 4
    local.get 352
    i32.store offset=112
    i32.const 1690
    local.set 353
    i32.const 112
    local.set 354
    local.get 4
    local.get 354
    i32.add
    local.set 355
    local.get 353
    local.get 355
    call $printf
    drop
    i32.const 2783
    local.set 356
    i32.const 0
    local.set 357
    local.get 356
    local.get 357
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 358
    i32.const 0
    local.set 359
    i32.const 2
    local.set 360
    local.get 358
    local.get 359
    local.get 360
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 361
    local.get 361
    call $ftell
    local.set 362
    local.get 4
    local.get 362
    i32.store offset=128
    i32.const 1690
    local.set 363
    i32.const 128
    local.set 364
    local.get 4
    local.get 364
    i32.add
    local.set 365
    local.get 363
    local.get 365
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 366
    local.get 366
    call $ftell
    local.set 367
    local.get 4
    i32.load offset=1580
    local.set 368
    local.get 368
    call $strlen
    local.set 369
    i32.const 1048576
    local.set 370
    local.get 369
    local.get 370
    i32.add
    local.set 371
    local.get 367
    local.set 372
    local.get 371
    local.set 373
    local.get 372
    local.get 373
    i32.eq
    local.set 374
    i32.const 1
    local.set 375
    local.get 374
    local.get 375
    i32.and
    local.set 376
    block  ;; label = @1
      local.get 376
      br_if 0 (;@1;)
      i32.const 1223
      local.set 377
      i32.const 1150
      local.set 378
      i32.const 138
      local.set 379
      i32.const 1113
      local.set 380
      local.get 377
      local.get 378
      local.get 379
      local.get 380
      call $__assert_fail
      unreachable
    end
    i32.const 2269
    local.set 381
    i32.const 0
    local.set 382
    local.get 381
    local.get 382
    call $printf
    drop
    i32.const 3055
    local.set 383
    i32.const 0
    local.set 384
    local.get 383
    local.get 384
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 385
    local.get 385
    call $fileno
    local.set 386
    local.get 4
    i32.load offset=1584
    local.set 387
    local.get 387
    call $ftell
    local.set 388
    i32.const 1048576
    local.set 389
    local.get 388
    local.get 389
    i32.add
    local.set 390
    local.get 390
    local.set 391
    local.get 391
    i64.extend_i32_s
    local.set 392
    local.get 386
    local.get 392
    call $ftruncate
    drop
    local.get 4
    i32.load offset=1584
    local.set 393
    local.get 393
    call $ftell
    local.set 394
    local.get 4
    i32.load offset=1580
    local.set 395
    local.get 395
    call $strlen
    local.set 396
    i32.const 1048576
    local.set 397
    local.get 396
    local.get 397
    i32.add
    local.set 398
    local.get 394
    local.set 399
    local.get 398
    local.set 400
    local.get 399
    local.get 400
    i32.eq
    local.set 401
    i32.const 1
    local.set 402
    local.get 401
    local.get 402
    i32.and
    local.set 403
    block  ;; label = @1
      local.get 403
      br_if 0 (;@1;)
      i32.const 1223
      local.set 404
      i32.const 1150
      local.set 405
      i32.const 144
      local.set 406
      i32.const 1113
      local.set 407
      local.get 404
      local.get 405
      local.get 406
      local.get 407
      call $__assert_fail
      unreachable
    end
    local.get 4
    i32.load offset=1584
    local.set 408
    local.get 408
    call $ftell
    local.set 409
    local.get 4
    local.get 409
    i32.store offset=80
    i32.const 1690
    local.set 410
    i32.const 80
    local.set 411
    local.get 4
    local.get 411
    i32.add
    local.set 412
    local.get 410
    local.get 412
    call $printf
    drop
    i32.const 2783
    local.set 413
    i32.const 0
    local.set 414
    local.get 413
    local.get 414
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 415
    i32.const 0
    local.set 416
    i32.const 2
    local.set 417
    local.get 415
    local.get 416
    local.get 417
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 418
    local.get 418
    call $ftell
    local.set 419
    local.get 4
    local.get 419
    i32.store offset=96
    i32.const 1690
    local.set 420
    i32.const 96
    local.set 421
    local.get 4
    local.get 421
    i32.add
    local.set 422
    local.get 420
    local.get 422
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 423
    local.get 423
    call $ftell
    local.set 424
    local.get 4
    i32.load offset=1580
    local.set 425
    local.get 425
    call $strlen
    local.set 426
    i32.const 2097152
    local.set 427
    local.get 426
    local.get 427
    i32.add
    local.set 428
    local.get 424
    local.set 429
    local.get 428
    local.set 430
    local.get 429
    local.get 430
    i32.eq
    local.set 431
    i32.const 1
    local.set 432
    local.get 431
    local.get 432
    i32.and
    local.set 433
    block  ;; label = @1
      local.get 433
      br_if 0 (;@1;)
      i32.const 1342
      local.set 434
      i32.const 1150
      local.set 435
      i32.const 149
      local.set 436
      i32.const 1113
      local.set 437
      local.get 434
      local.get 435
      local.get 436
      local.get 437
      call $__assert_fail
      unreachable
    end
    i32.const 2169
    local.set 438
    i32.const 0
    local.set 439
    local.get 438
    local.get 439
    call $printf
    drop
    i32.const 2310
    local.set 440
    i32.const 0
    local.set 441
    local.get 440
    local.get 441
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 442
    local.get 442
    call $ftell
    local.set 443
    local.get 4
    local.get 443
    i32.store offset=48
    i32.const 1690
    local.set 444
    i32.const 48
    local.set 445
    local.get 4
    local.get 445
    i32.add
    local.set 446
    local.get 444
    local.get 446
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 447
    i32.const 3145728
    local.set 448
    i32.const 0
    local.set 449
    local.get 447
    local.get 448
    local.get 449
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 450
    local.get 450
    call $ftell
    local.set 451
    local.get 4
    local.get 451
    i32.store offset=64
    i32.const 1690
    local.set 452
    i32.const 64
    local.set 453
    local.get 4
    local.get 453
    i32.add
    local.set 454
    local.get 452
    local.get 454
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 455
    local.get 455
    call $ftell
    local.set 456
    i32.const 3145728
    local.set 457
    local.get 456
    local.set 458
    local.get 457
    local.set 459
    local.get 458
    local.get 459
    i32.eq
    local.set 460
    i32.const 1
    local.set 461
    local.get 460
    local.get 461
    i32.and
    local.set 462
    block  ;; label = @1
      local.get 462
      br_if 0 (;@1;)
      i32.const 1306
      local.set 463
      i32.const 1150
      local.set 464
      i32.const 157
      local.set 465
      i32.const 1113
      local.set 466
      local.get 463
      local.get 464
      local.get 465
      local.get 466
      call $__assert_fail
      unreachable
    end
    i32.const 2169
    local.set 467
    i32.const 0
    local.set 468
    local.get 467
    local.get 468
    call $printf
    drop
    i32.const 2724
    local.set 469
    i32.const 0
    local.set 470
    local.get 469
    local.get 470
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 471
    i32.const 3145728
    local.set 472
    i32.const 0
    local.set 473
    local.get 471
    local.get 472
    local.get 473
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 474
    local.get 474
    call $ftell
    local.set 475
    local.get 4
    local.get 475
    i32.store offset=16
    i32.const 1690
    local.set 476
    i32.const 16
    local.set 477
    local.get 4
    local.get 477
    i32.add
    local.set 478
    local.get 476
    local.get 478
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 479
    i32.const 2097152
    local.set 480
    i32.const 1
    local.set 481
    local.get 479
    local.get 480
    local.get 481
    call $fseek
    drop
    local.get 4
    i32.load offset=1584
    local.set 482
    local.get 482
    call $ftell
    local.set 483
    local.get 4
    local.get 483
    i32.store offset=32
    i32.const 1690
    local.set 484
    i32.const 32
    local.set 485
    local.get 4
    local.get 485
    i32.add
    local.set 486
    local.get 484
    local.get 486
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 487
    local.get 487
    call $ftell
    local.set 488
    i32.const 5242880
    local.set 489
    local.get 488
    local.set 490
    local.get 489
    local.set 491
    local.get 490
    local.get 491
    i32.eq
    local.set 492
    i32.const 1
    local.set 493
    local.get 492
    local.get 493
    i32.and
    local.set 494
    block  ;; label = @1
      local.get 494
      br_if 0 (;@1;)
      i32.const 1270
      local.set 495
      i32.const 1150
      local.set 496
      i32.const 166
      local.set 497
      i32.const 1113
      local.set 498
      local.get 495
      local.get 496
      local.get 497
      local.get 498
      call $__assert_fail
      unreachable
    end
    i32.const 2169
    local.set 499
    i32.const 0
    local.set 500
    local.get 499
    local.get 500
    call $printf
    drop
    i32.const 2416
    local.set 501
    i32.const 0
    local.set 502
    local.get 501
    local.get 502
    call $printf
    drop
    i32.const 1053
    local.set 503
    i32.const 400
    local.set 504
    local.get 4
    local.get 504
    i32.add
    local.set 505
    local.get 505
    local.set 506
    local.get 503
    local.get 506
    call $stat
    drop
    local.get 4
    i64.load offset=448
    local.set 507
    local.get 4
    local.get 507
    i64.store offset=560
    local.get 4
    i64.load offset=560
    local.set 508
    i64.const 0
    local.set 509
    local.get 508
    local.set 510
    local.get 509
    local.set 511
    local.get 510
    local.get 511
    i64.ne
    local.set 512
    i32.const 1
    local.set 513
    local.get 512
    local.get 513
    i32.and
    local.set 514
    block  ;; label = @1
      local.get 514
      br_if 0 (;@1;)
      i32.const 1538
      local.set 515
      i32.const 1150
      local.set 516
      i32.const 174
      local.set 517
      i32.const 1113
      local.set 518
      local.get 515
      local.get 516
      local.get 517
      local.get 518
      call $__assert_fail
      unreachable
    end
    local.get 4
    i32.load offset=1584
    local.set 519
    local.get 519
    call $fileno
    local.set 520
    i32.const 400
    local.set 521
    local.get 4
    local.get 521
    i32.add
    local.set 522
    local.get 522
    local.set 523
    local.get 520
    local.get 523
    call $fstat
    drop
    local.get 4
    i64.load offset=560
    local.set 524
    local.get 4
    i64.load offset=448
    local.set 525
    local.get 4
    local.get 525
    i64.store offset=8
    local.get 4
    local.get 524
    i64.store
    i32.const 3102
    local.set 526
    local.get 526
    local.get 4
    call $printf
    drop
    local.get 4
    i64.load offset=560
    local.set 527
    i64.const 0
    local.set 528
    local.get 527
    local.set 529
    local.get 528
    local.set 530
    local.get 529
    local.get 530
    i64.ne
    local.set 531
    i32.const 1
    local.set 532
    local.get 531
    local.get 532
    i32.and
    local.set 533
    block  ;; label = @1
      local.get 533
      br_if 0 (;@1;)
      i32.const 1538
      local.set 534
      i32.const 1150
      local.set 535
      i32.const 180
      local.set 536
      i32.const 1113
      local.set 537
      local.get 534
      local.get 535
      local.get 536
      local.get 537
      call $__assert_fail
      unreachable
    end
    local.get 4
    i64.load offset=560
    local.set 538
    local.get 4
    i64.load offset=448
    local.set 539
    local.get 538
    local.set 540
    local.get 539
    local.set 541
    local.get 540
    local.get 541
    i64.eq
    local.set 542
    i32.const 1
    local.set 543
    local.get 542
    local.get 543
    i32.and
    local.set 544
    block  ;; label = @1
      local.get 544
      br_if 0 (;@1;)
      i32.const 1126
      local.set 545
      i32.const 1150
      local.set 546
      i32.const 181
      local.set 547
      i32.const 1113
      local.set 548
      local.get 545
      local.get 546
      local.get 547
      local.get 548
      call $__assert_fail
      unreachable
    end
    i32.const 2566
    local.set 549
    i32.const 0
    local.set 550
    local.get 549
    local.get 550
    call $printf
    drop
    local.get 4
    i32.load offset=1584
    local.set 551
    local.get 551
    call $fclose
    local.set 552
    local.get 4
    local.get 552
    i32.store offset=572
    local.get 4
    i32.load offset=572
    local.set 553
    block  ;; label = @1
      local.get 553
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1434
      local.set 554
      i32.const 1150
      local.set 555
      i32.const 186
      local.set 556
      i32.const 1113
      local.set 557
      local.get 554
      local.get 555
      local.get 556
      local.get 557
      call $__assert_fail
      unreachable
    end
    i32.const 2212
    local.set 558
    i32.const 0
    local.set 559
    local.get 558
    local.get 559
    call $printf
    drop
    i32.const 2687
    local.set 560
    i32.const 0
    local.set 561
    local.get 560
    local.get 561
    call $printf
    drop
    i32.const 1053
    local.set 562
    local.get 562
    call $remove
    local.set 563
    local.get 4
    local.get 563
    i32.store offset=572
    local.get 4
    i32.load offset=572
    local.set 564
    block  ;; label = @1
      local.get 564
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1434
      local.set 565
      i32.const 1150
      local.set 566
      i32.const 192
      local.set 567
      i32.const 1113
      local.set 568
      local.get 565
      local.get 566
      local.get 567
      local.get 568
      call $__assert_fail
      unreachable
    end
    i32.const 2241
    local.set 569
    i32.const 0
    local.set 570
    local.get 569
    local.get 570
    call $printf
    drop
    i32.const 3183
    local.set 571
    i32.const 0
    local.set 572
    local.get 571
    local.get 572
    call $printf
    drop
    i32.const 0
    local.set 573
    i32.const 1600
    local.set 574
    local.get 4
    local.get 574
    i32.add
    local.set 575
    local.get 575
    global.set $__stack_pointer
    local.get 573
    return)
  (func $posix_fallocate (type 4) (param i32 i64 i64) (result i32)
    block  ;; label = @1
      local.get 2
      local.get 1
      i64.or
      i64.const 0
      i64.ge_s
      br_if 0 (;@1;)
      i32.const 28
      return
    end
    local.get 0
    local.get 1
    local.get 2
    call $__wasi_fd_allocate)
  (func $ftruncate (type 5) (param i32 i64) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i64.const 0
        i64.ge_s
        br_if 0 (;@2;)
        i32.const 28
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      call $__wasi_fd_filestat_set_size
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 0
    i32.store offset=5696
    i32.const -1)
  (func $pread (type 13) (param i32 i32 i32 i64) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i64.const -1
        i64.gt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.const 28
        i32.store offset=5696
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 4
      local.get 2
      i32.store offset=44
      local.get 4
      local.get 1
      i32.store offset=40
      block  ;; label = @2
        local.get 0
        local.get 4
        i32.const 40
        i32.add
        i32.const 1
        local.get 3
        local.get 4
        i32.const 36
        i32.add
        call $__wasi_fd_pread
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 76
          i32.ne
          br_if 0 (;@3;)
          i32.const 76
          local.set 1
          local.get 0
          local.get 4
          i32.const 8
          i32.add
          call $__wasi_fd_fdstat_get
          br_if 0 (;@3;)
          i32.const 70
          i32.const 8
          local.get 4
          i32.load8_u offset=16
          i32.const 2
          i32.and
          select
          local.set 1
        end
        i32.const 0
        local.get 1
        i32.store offset=5696
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 4
      i32.load offset=36
      local.set 0
    end
    local.get 4
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $pwrite (type 13) (param i32 i32 i32 i64) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i64.const -1
        i64.gt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.const 28
        i32.store offset=5696
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 4
      local.get 2
      i32.store offset=44
      local.get 4
      local.get 1
      i32.store offset=40
      block  ;; label = @2
        local.get 0
        local.get 4
        i32.const 40
        i32.add
        i32.const 1
        local.get 3
        local.get 4
        i32.const 36
        i32.add
        call $__wasi_fd_pwrite
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 76
          i32.ne
          br_if 0 (;@3;)
          i32.const 76
          local.set 1
          local.get 0
          local.get 4
          i32.const 8
          i32.add
          call $__wasi_fd_fdstat_get
          br_if 0 (;@3;)
          i32.const 70
          i32.const 8
          local.get 4
          i32.load8_u offset=16
          i32.const 64
          i32.and
          select
          local.set 1
        end
        i32.const 0
        local.get 1
        i32.store offset=5696
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 4
      i32.load offset=36
      local.set 0
    end
    local.get 4
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $fstat (type 3) (param i32 i32) (result i32)
    (local i32 i64 i64 i64 i64 i64 i64 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 2
        call $__wasi_fd_filestat_get
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=5696
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 1
      i64.const 0
      i64.store offset=24
      local.get 1
      local.get 2
      i64.load offset=24
      i64.store offset=16
      local.get 1
      local.get 2
      i64.load offset=8
      i64.store offset=8
      local.get 1
      local.get 2
      i64.load
      i64.store
      local.get 1
      i64.const 0
      i64.store offset=64
      i32.const 0
      local.set 0
      local.get 1
      i32.const 0
      i32.store offset=56
      local.get 1
      local.get 2
      i64.load offset=32
      i64.store offset=48
      local.get 2
      i32.const 80
      i32.add
      i64.const 0
      i64.store align=4
      local.get 2
      i32.const 88
      i32.add
      i64.const 0
      i64.store align=4
      local.get 1
      i32.const 32
      i32.add
      i64.const 0
      i64.store
      local.get 1
      i32.const 40
      i32.add
      i64.const 0
      i64.store
      local.get 1
      local.get 2
      i64.load offset=56
      local.tee 3
      i64.const 1000000000
      i64.div_u
      local.tee 4
      i64.store offset=104
      local.get 1
      local.get 2
      i64.load offset=48
      local.tee 5
      i64.const 1000000000
      i64.div_u
      local.tee 6
      i64.store offset=88
      local.get 1
      local.get 2
      i64.load offset=40
      local.tee 7
      i64.const 1000000000
      i64.div_u
      local.tee 8
      i64.store offset=72
      local.get 1
      i32.const 112
      i32.add
      local.get 3
      local.get 4
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32
      local.get 1
      i32.const 96
      i32.add
      local.get 5
      local.get 6
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32
      local.get 1
      i32.const 80
      i32.add
      local.get 7
      local.get 8
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32
      local.get 2
      i64.const 0
      i64.store offset=72 align=4
      local.get 1
      i32.const 140
      i32.add
      local.get 2
      i32.const 68
      i32.add
      i32.const 24
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 132
      i32.add
      local.get 2
      i32.const 84
      i32.add
      i64.load align=4
      i64.store align=4
      local.get 1
      i32.const 124
      i32.add
      local.get 2
      i32.const 76
      i32.add
      i64.load align=4
      i64.store align=4
      local.get 1
      local.get 2
      i64.load offset=68 align=4
      i64.store offset=116 align=4
      local.get 2
      i32.load8_u offset=16
      i32.const -1
      i32.add
      local.tee 9
      i32.const 255
      i32.and
      i32.const 6
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 24
      i32.add
      local.get 9
      i32.const 24
      i32.shl
      i32.const 24
      i32.shr_s
      i32.const 2
      i32.shl
      i32.const 3208
      i32.add
      i32.load
      i32.store
    end
    local.get 2
    i32.const 96
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $malloc (type 0) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load offset=5724
      br_if 0 (;@1;)
      i32.const 0
      call $sbrk
      i32.const 72848
      i32.sub
      local.tee 2
      i32.const 89
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 3
      block  ;; label = @2
        i32.const 0
        i32.load offset=6172
        local.tee 4
        br_if 0 (;@2;)
        i32.const 0
        i64.const -1
        i64.store offset=6184 align=4
        i32.const 0
        i64.const 281474976776192
        i64.store offset=6176 align=4
        i32.const 0
        local.get 1
        i32.const 8
        i32.add
        i32.const -16
        i32.and
        i32.const 1431655768
        i32.xor
        local.tee 4
        i32.store offset=6172
        i32.const 0
        i32.const 0
        i32.store offset=6192
        i32.const 0
        i32.const 0
        i32.store offset=6144
      end
      i32.const 0
      local.get 2
      i32.store offset=6152
      i32.const 0
      i32.const 72848
      i32.store offset=6148
      i32.const 0
      i32.const 72848
      i32.store offset=5716
      i32.const 0
      local.get 4
      i32.store offset=5736
      i32.const 0
      i32.const -1
      i32.store offset=5732
      loop  ;; label = @2
        local.get 3
        i32.const 5760
        i32.add
        local.get 3
        i32.const 5748
        i32.add
        local.tee 4
        i32.store
        local.get 4
        local.get 3
        i32.const 5740
        i32.add
        local.tee 5
        i32.store
        local.get 3
        i32.const 5752
        i32.add
        local.get 5
        i32.store
        local.get 3
        i32.const 5768
        i32.add
        local.get 3
        i32.const 5756
        i32.add
        local.tee 5
        i32.store
        local.get 5
        local.get 4
        i32.store
        local.get 3
        i32.const 5776
        i32.add
        local.get 3
        i32.const 5764
        i32.add
        local.tee 4
        i32.store
        local.get 4
        local.get 5
        i32.store
        local.get 3
        i32.const 5772
        i32.add
        local.get 4
        i32.store
        local.get 3
        i32.const 32
        i32.add
        local.tee 3
        i32.const 256
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 72848
      i32.const -8
      i32.const 72848
      i32.sub
      i32.const 15
      i32.and
      i32.const 0
      i32.const 72848
      i32.const 8
      i32.add
      i32.const 15
      i32.and
      select
      local.tee 3
      i32.add
      local.tee 4
      i32.const 4
      i32.add
      local.get 2
      i32.const -56
      i32.add
      local.tee 5
      local.get 3
      i32.sub
      local.tee 3
      i32.const 1
      i32.or
      i32.store
      i32.const 0
      i32.const 0
      i32.load offset=6188
      i32.store offset=5728
      i32.const 0
      local.get 3
      i32.store offset=5712
      i32.const 0
      local.get 4
      i32.store offset=5724
      i32.const 72848
      local.get 5
      i32.add
      i32.const 56
      i32.store offset=4
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 236
                            i32.gt_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=5700
                              local.tee 6
                              i32.const 16
                              local.get 0
                              i32.const 19
                              i32.add
                              i32.const -16
                              i32.and
                              local.get 0
                              i32.const 11
                              i32.lt_u
                              select
                              local.tee 2
                              i32.const 3
                              i32.shr_u
                              local.tee 4
                              i32.shr_u
                              local.tee 3
                              i32.const 3
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 3
                              i32.const 1
                              i32.and
                              local.get 4
                              i32.or
                              i32.const 1
                              i32.xor
                              local.tee 5
                              i32.const 3
                              i32.shl
                              local.tee 0
                              i32.const 5748
                              i32.add
                              i32.load
                              local.tee 4
                              i32.const 8
                              i32.add
                              local.set 3
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  i32.load offset=8
                                  local.tee 2
                                  local.get 0
                                  i32.const 5740
                                  i32.add
                                  local.tee 0
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 6
                                  i32.const -2
                                  local.get 5
                                  i32.rotl
                                  i32.and
                                  i32.store offset=5700
                                  br 1 (;@14;)
                                end
                                local.get 0
                                local.get 2
                                i32.store offset=8
                                local.get 2
                                local.get 0
                                i32.store offset=12
                              end
                              local.get 4
                              local.get 5
                              i32.const 3
                              i32.shl
                              local.tee 5
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 4
                              local.get 5
                              i32.add
                              local.tee 4
                              local.get 4
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              br 12 (;@1;)
                            end
                            local.get 2
                            i32.const 0
                            i32.load offset=5708
                            local.tee 7
                            i32.le_u
                            br_if 1 (;@11;)
                            block  ;; label = @13
                              local.get 3
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 3
                                  local.get 4
                                  i32.shl
                                  i32.const 2
                                  local.get 4
                                  i32.shl
                                  local.tee 3
                                  i32.const 0
                                  local.get 3
                                  i32.sub
                                  i32.or
                                  i32.and
                                  local.tee 3
                                  i32.const 0
                                  local.get 3
                                  i32.sub
                                  i32.and
                                  i32.const -1
                                  i32.add
                                  local.tee 3
                                  local.get 3
                                  i32.const 12
                                  i32.shr_u
                                  i32.const 16
                                  i32.and
                                  local.tee 3
                                  i32.shr_u
                                  local.tee 4
                                  i32.const 5
                                  i32.shr_u
                                  i32.const 8
                                  i32.and
                                  local.tee 5
                                  local.get 3
                                  i32.or
                                  local.get 4
                                  local.get 5
                                  i32.shr_u
                                  local.tee 3
                                  i32.const 2
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  local.tee 4
                                  i32.or
                                  local.get 3
                                  local.get 4
                                  i32.shr_u
                                  local.tee 3
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 2
                                  i32.and
                                  local.tee 4
                                  i32.or
                                  local.get 3
                                  local.get 4
                                  i32.shr_u
                                  local.tee 3
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 1
                                  i32.and
                                  local.tee 4
                                  i32.or
                                  local.get 3
                                  local.get 4
                                  i32.shr_u
                                  i32.add
                                  local.tee 5
                                  i32.const 3
                                  i32.shl
                                  local.tee 0
                                  i32.const 5748
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  i32.load offset=8
                                  local.tee 3
                                  local.get 0
                                  i32.const 5740
                                  i32.add
                                  local.tee 0
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 6
                                  i32.const -2
                                  local.get 5
                                  i32.rotl
                                  i32.and
                                  local.tee 6
                                  i32.store offset=5700
                                  br 1 (;@14;)
                                end
                                local.get 0
                                local.get 3
                                i32.store offset=8
                                local.get 3
                                local.get 0
                                i32.store offset=12
                              end
                              local.get 4
                              i32.const 8
                              i32.add
                              local.set 3
                              local.get 4
                              local.get 2
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 4
                              local.get 5
                              i32.const 3
                              i32.shl
                              local.tee 5
                              i32.add
                              local.get 5
                              local.get 2
                              i32.sub
                              local.tee 5
                              i32.store
                              local.get 4
                              local.get 2
                              i32.add
                              local.tee 0
                              local.get 5
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              block  ;; label = @14
                                local.get 7
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 7
                                i32.const 3
                                i32.shr_u
                                local.tee 8
                                i32.const 3
                                i32.shl
                                i32.const 5740
                                i32.add
                                local.set 2
                                i32.const 0
                                i32.load offset=5720
                                local.set 4
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 6
                                    i32.const 1
                                    local.get 8
                                    i32.shl
                                    local.tee 8
                                    i32.and
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    local.get 8
                                    i32.or
                                    i32.store offset=5700
                                    local.get 2
                                    local.set 8
                                    br 1 (;@15;)
                                  end
                                  local.get 2
                                  i32.load offset=8
                                  local.set 8
                                end
                                local.get 8
                                local.get 4
                                i32.store offset=12
                                local.get 2
                                local.get 4
                                i32.store offset=8
                                local.get 4
                                local.get 2
                                i32.store offset=12
                                local.get 4
                                local.get 8
                                i32.store offset=8
                              end
                              i32.const 0
                              local.get 0
                              i32.store offset=5720
                              i32.const 0
                              local.get 5
                              i32.store offset=5708
                              br 12 (;@1;)
                            end
                            i32.const 0
                            i32.load offset=5704
                            local.tee 9
                            i32.eqz
                            br_if 1 (;@11;)
                            local.get 9
                            i32.const 0
                            local.get 9
                            i32.sub
                            i32.and
                            i32.const -1
                            i32.add
                            local.tee 3
                            local.get 3
                            i32.const 12
                            i32.shr_u
                            i32.const 16
                            i32.and
                            local.tee 3
                            i32.shr_u
                            local.tee 4
                            i32.const 5
                            i32.shr_u
                            i32.const 8
                            i32.and
                            local.tee 5
                            local.get 3
                            i32.or
                            local.get 4
                            local.get 5
                            i32.shr_u
                            local.tee 3
                            i32.const 2
                            i32.shr_u
                            i32.const 4
                            i32.and
                            local.tee 4
                            i32.or
                            local.get 3
                            local.get 4
                            i32.shr_u
                            local.tee 3
                            i32.const 1
                            i32.shr_u
                            i32.const 2
                            i32.and
                            local.tee 4
                            i32.or
                            local.get 3
                            local.get 4
                            i32.shr_u
                            local.tee 3
                            i32.const 1
                            i32.shr_u
                            i32.const 1
                            i32.and
                            local.tee 4
                            i32.or
                            local.get 3
                            local.get 4
                            i32.shr_u
                            i32.add
                            i32.const 2
                            i32.shl
                            i32.const 6004
                            i32.add
                            i32.load
                            local.tee 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 2
                            i32.sub
                            local.set 4
                            local.get 0
                            local.set 5
                            block  ;; label = @13
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 5
                                  i32.load offset=16
                                  local.tee 3
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.tee 3
                                  i32.eqz
                                  br_if 2 (;@13;)
                                end
                                local.get 3
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 2
                                i32.sub
                                local.tee 5
                                local.get 4
                                local.get 5
                                local.get 4
                                i32.lt_u
                                local.tee 5
                                select
                                local.set 4
                                local.get 3
                                local.get 0
                                local.get 5
                                select
                                local.set 0
                                local.get 3
                                local.set 5
                                br 0 (;@14;)
                              end
                            end
                            local.get 0
                            i32.load offset=24
                            local.set 10
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=12
                              local.tee 8
                              local.get 0
                              i32.eq
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=5716
                              local.get 0
                              i32.load offset=8
                              local.tee 3
                              i32.gt_u
                              drop
                              local.get 8
                              local.get 3
                              i32.store offset=8
                              local.get 3
                              local.get 8
                              i32.store offset=12
                              br 11 (;@2;)
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 3
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load offset=16
                              local.tee 3
                              i32.eqz
                              br_if 3 (;@10;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 5
                            end
                            loop  ;; label = @13
                              local.get 5
                              local.set 11
                              local.get 3
                              local.tee 8
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 3
                              br_if 0 (;@13;)
                              local.get 8
                              i32.const 16
                              i32.add
                              local.set 5
                              local.get 8
                              i32.load offset=16
                              local.tee 3
                              br_if 0 (;@13;)
                            end
                            local.get 11
                            i32.const 0
                            i32.store
                            br 10 (;@2;)
                          end
                          i32.const -1
                          local.set 2
                          local.get 0
                          i32.const -65
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 19
                          i32.add
                          local.tee 3
                          i32.const -16
                          i32.and
                          local.set 2
                          i32.const 0
                          i32.load offset=5704
                          local.tee 7
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 11
                          block  ;; label = @12
                            local.get 2
                            i32.const 256
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 31
                            local.set 11
                            local.get 2
                            i32.const 16777215
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 8
                            i32.shr_u
                            local.tee 3
                            local.get 3
                            i32.const 1048320
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 8
                            i32.and
                            local.tee 3
                            i32.shl
                            local.tee 4
                            local.get 4
                            i32.const 520192
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 4
                            i32.and
                            local.tee 4
                            i32.shl
                            local.tee 5
                            local.get 5
                            i32.const 245760
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 2
                            i32.and
                            local.tee 5
                            i32.shl
                            i32.const 15
                            i32.shr_u
                            local.get 3
                            local.get 4
                            i32.or
                            local.get 5
                            i32.or
                            i32.sub
                            local.tee 3
                            i32.const 1
                            i32.shl
                            local.get 2
                            local.get 3
                            i32.const 21
                            i32.add
                            i32.shr_u
                            i32.const 1
                            i32.and
                            i32.or
                            i32.const 28
                            i32.add
                            local.set 11
                          end
                          i32.const 0
                          local.get 2
                          i32.sub
                          local.set 4
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 11
                                  i32.const 2
                                  i32.shl
                                  i32.const 6004
                                  i32.add
                                  i32.load
                                  local.tee 5
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 3
                                  i32.const 0
                                  local.set 8
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                local.set 3
                                local.get 2
                                i32.const 0
                                i32.const 25
                                local.get 11
                                i32.const 1
                                i32.shr_u
                                i32.sub
                                local.get 11
                                i32.const 31
                                i32.eq
                                select
                                i32.shl
                                local.set 0
                                i32.const 0
                                local.set 8
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 5
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 2
                                    i32.sub
                                    local.tee 6
                                    local.get 4
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                    local.get 6
                                    local.set 4
                                    local.get 5
                                    local.set 8
                                    local.get 6
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 4
                                    local.get 5
                                    local.set 8
                                    local.get 5
                                    local.set 3
                                    br 3 (;@13;)
                                  end
                                  local.get 3
                                  local.get 5
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.tee 6
                                  local.get 6
                                  local.get 5
                                  local.get 0
                                  i32.const 29
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  i32.add
                                  i32.const 16
                                  i32.add
                                  i32.load
                                  local.tee 5
                                  i32.eq
                                  select
                                  local.get 3
                                  local.get 6
                                  select
                                  local.set 3
                                  local.get 0
                                  i32.const 1
                                  i32.shl
                                  local.set 0
                                  local.get 5
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 3
                                local.get 8
                                i32.or
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 8
                                i32.const 2
                                local.get 11
                                i32.shl
                                local.tee 3
                                i32.const 0
                                local.get 3
                                i32.sub
                                i32.or
                                local.get 7
                                i32.and
                                local.tee 3
                                i32.eqz
                                br_if 3 (;@11;)
                                local.get 3
                                i32.const 0
                                local.get 3
                                i32.sub
                                i32.and
                                i32.const -1
                                i32.add
                                local.tee 3
                                local.get 3
                                i32.const 12
                                i32.shr_u
                                i32.const 16
                                i32.and
                                local.tee 3
                                i32.shr_u
                                local.tee 5
                                i32.const 5
                                i32.shr_u
                                i32.const 8
                                i32.and
                                local.tee 0
                                local.get 3
                                i32.or
                                local.get 5
                                local.get 0
                                i32.shr_u
                                local.tee 3
                                i32.const 2
                                i32.shr_u
                                i32.const 4
                                i32.and
                                local.tee 5
                                i32.or
                                local.get 3
                                local.get 5
                                i32.shr_u
                                local.tee 3
                                i32.const 1
                                i32.shr_u
                                i32.const 2
                                i32.and
                                local.tee 5
                                i32.or
                                local.get 3
                                local.get 5
                                i32.shr_u
                                local.tee 3
                                i32.const 1
                                i32.shr_u
                                i32.const 1
                                i32.and
                                local.tee 5
                                i32.or
                                local.get 3
                                local.get 5
                                i32.shr_u
                                i32.add
                                i32.const 2
                                i32.shl
                                i32.const 6004
                                i32.add
                                i32.load
                                local.set 3
                              end
                              local.get 3
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 3
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 2
                              i32.sub
                              local.tee 6
                              local.get 4
                              i32.lt_u
                              local.set 0
                              block  ;; label = @14
                                local.get 3
                                i32.load offset=16
                                local.tee 5
                                br_if 0 (;@14;)
                                local.get 3
                                i32.const 20
                                i32.add
                                i32.load
                                local.set 5
                              end
                              local.get 6
                              local.get 4
                              local.get 0
                              select
                              local.set 4
                              local.get 3
                              local.get 8
                              local.get 0
                              select
                              local.set 8
                              local.get 5
                              local.set 3
                              local.get 5
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 8
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 4
                          i32.const 0
                          i32.load offset=5708
                          local.get 2
                          i32.sub
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 8
                          i32.load offset=24
                          local.set 11
                          block  ;; label = @12
                            local.get 8
                            i32.load offset=12
                            local.tee 0
                            local.get 8
                            i32.eq
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=5716
                            local.get 8
                            i32.load offset=8
                            local.tee 3
                            i32.gt_u
                            drop
                            local.get 0
                            local.get 3
                            i32.store offset=8
                            local.get 3
                            local.get 0
                            i32.store offset=12
                            br 9 (;@3;)
                          end
                          block  ;; label = @12
                            local.get 8
                            i32.const 20
                            i32.add
                            local.tee 5
                            i32.load
                            local.tee 3
                            br_if 0 (;@12;)
                            local.get 8
                            i32.load offset=16
                            local.tee 3
                            i32.eqz
                            br_if 3 (;@9;)
                            local.get 8
                            i32.const 16
                            i32.add
                            local.set 5
                          end
                          loop  ;; label = @12
                            local.get 5
                            local.set 6
                            local.get 3
                            local.tee 0
                            i32.const 20
                            i32.add
                            local.tee 5
                            i32.load
                            local.tee 3
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 16
                            i32.add
                            local.set 5
                            local.get 0
                            i32.load offset=16
                            local.tee 3
                            br_if 0 (;@12;)
                          end
                          local.get 6
                          i32.const 0
                          i32.store
                          br 8 (;@3;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=5708
                          local.tee 3
                          local.get 2
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=5720
                          local.set 4
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 3
                              local.get 2
                              i32.sub
                              local.tee 5
                              i32.const 16
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.get 2
                              i32.add
                              local.tee 0
                              local.get 5
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.get 5
                              i32.store offset=5708
                              i32.const 0
                              local.get 0
                              i32.store offset=5720
                              local.get 4
                              local.get 3
                              i32.add
                              local.get 5
                              i32.store
                              local.get 4
                              local.get 2
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              br 1 (;@12;)
                            end
                            local.get 4
                            local.get 3
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 4
                            local.get 3
                            i32.add
                            local.tee 3
                            local.get 3
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            i32.const 0
                            i32.store offset=5720
                            i32.const 0
                            i32.const 0
                            i32.store offset=5708
                          end
                          local.get 4
                          i32.const 8
                          i32.add
                          local.set 3
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=5712
                          local.tee 0
                          local.get 2
                          i32.le_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=5724
                          local.tee 3
                          local.get 2
                          i32.add
                          local.tee 4
                          local.get 0
                          local.get 2
                          i32.sub
                          local.tee 5
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.get 5
                          i32.store offset=5712
                          i32.const 0
                          local.get 4
                          i32.store offset=5724
                          local.get 3
                          local.get 2
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 3
                          i32.const 8
                          i32.add
                          local.set 3
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=6172
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=6180
                            local.set 4
                            br 1 (;@11;)
                          end
                          i32.const 0
                          i64.const -1
                          i64.store offset=6184 align=4
                          i32.const 0
                          i64.const 281474976776192
                          i64.store offset=6176 align=4
                          i32.const 0
                          local.get 1
                          i32.const 12
                          i32.add
                          i32.const -16
                          i32.and
                          i32.const 1431655768
                          i32.xor
                          i32.store offset=6172
                          i32.const 0
                          i32.const 0
                          i32.store offset=6192
                          i32.const 0
                          i32.const 0
                          i32.store offset=6144
                          i32.const 65536
                          local.set 4
                        end
                        i32.const 0
                        local.set 3
                        block  ;; label = @11
                          local.get 4
                          local.get 2
                          i32.const 71
                          i32.add
                          local.tee 7
                          i32.add
                          local.tee 6
                          i32.const 0
                          local.get 4
                          i32.sub
                          local.tee 11
                          i32.and
                          local.tee 8
                          local.get 2
                          i32.gt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 48
                          i32.store offset=5696
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=6140
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=6132
                            local.tee 4
                            local.get 8
                            i32.add
                            local.tee 5
                            local.get 4
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 5
                            local.get 3
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.set 3
                          i32.const 0
                          i32.const 48
                          i32.store offset=5696
                          br 10 (;@1;)
                        end
                        i32.const 0
                        i32.load8_u offset=6144
                        i32.const 4
                        i32.and
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=5724
                              local.tee 4
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 6148
                              local.set 3
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 3
                                  i32.load
                                  local.tee 5
                                  local.get 4
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 5
                                  local.get 3
                                  i32.load offset=4
                                  i32.add
                                  local.get 4
                                  i32.gt_u
                                  br_if 3 (;@12;)
                                end
                                local.get 3
                                i32.load offset=8
                                local.tee 3
                                br_if 0 (;@14;)
                              end
                            end
                            i32.const 0
                            call $sbrk
                            local.tee 0
                            i32.const -1
                            i32.eq
                            br_if 5 (;@7;)
                            local.get 8
                            local.set 6
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=6176
                              local.tee 3
                              i32.const -1
                              i32.add
                              local.tee 4
                              local.get 0
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 8
                              local.get 0
                              i32.sub
                              local.get 4
                              local.get 0
                              i32.add
                              i32.const 0
                              local.get 3
                              i32.sub
                              i32.and
                              i32.add
                              local.set 6
                            end
                            local.get 6
                            local.get 2
                            i32.le_u
                            br_if 5 (;@7;)
                            local.get 6
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=6140
                              local.tee 3
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=6132
                              local.tee 4
                              local.get 6
                              i32.add
                              local.tee 5
                              local.get 4
                              i32.le_u
                              br_if 6 (;@7;)
                              local.get 5
                              local.get 3
                              i32.gt_u
                              br_if 6 (;@7;)
                            end
                            local.get 6
                            call $sbrk
                            local.tee 3
                            local.get 0
                            i32.ne
                            br_if 1 (;@11;)
                            br 7 (;@5;)
                          end
                          local.get 6
                          local.get 0
                          i32.sub
                          local.get 11
                          i32.and
                          local.tee 6
                          i32.const 2147483646
                          i32.gt_u
                          br_if 4 (;@7;)
                          local.get 6
                          call $sbrk
                          local.tee 0
                          local.get 3
                          i32.load
                          local.get 3
                          i32.load offset=4
                          i32.add
                          i32.eq
                          br_if 3 (;@8;)
                          local.get 0
                          local.set 3
                        end
                        block  ;; label = @11
                          local.get 3
                          i32.const -1
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 2
                          i32.const 72
                          i32.add
                          local.get 6
                          i32.le_u
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            local.get 7
                            local.get 6
                            i32.sub
                            i32.const 0
                            i32.load offset=6180
                            local.tee 4
                            i32.add
                            i32.const 0
                            local.get 4
                            i32.sub
                            i32.and
                            local.tee 4
                            i32.const 2147483646
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 3
                            local.set 0
                            br 7 (;@5;)
                          end
                          block  ;; label = @12
                            local.get 4
                            call $sbrk
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 4
                            local.get 6
                            i32.add
                            local.set 6
                            local.get 3
                            local.set 0
                            br 7 (;@5;)
                          end
                          i32.const 0
                          local.get 6
                          i32.sub
                          call $sbrk
                          drop
                          br 4 (;@7;)
                        end
                        local.get 3
                        local.set 0
                        local.get 3
                        i32.const -1
                        i32.ne
                        br_if 5 (;@5;)
                        br 3 (;@7;)
                      end
                      i32.const 0
                      local.set 8
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 0
                    br 5 (;@3;)
                  end
                  local.get 0
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=6144
                i32.const 4
                i32.or
                i32.store offset=6144
              end
              local.get 8
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 8
              call $sbrk
              local.set 0
              i32.const 0
              call $sbrk
              local.set 3
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 3
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 3
              i32.ge_u
              br_if 1 (;@4;)
              local.get 3
              local.get 0
              i32.sub
              local.tee 6
              local.get 2
              i32.const 56
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=6132
            local.get 6
            i32.add
            local.tee 3
            i32.store offset=6132
            block  ;; label = @5
              local.get 3
              i32.const 0
              i32.load offset=6136
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 3
              i32.store offset=6136
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=5724
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 6148
                    local.set 3
                    loop  ;; label = @9
                      local.get 0
                      local.get 3
                      i32.load
                      local.tee 5
                      local.get 3
                      i32.load offset=4
                      local.tee 8
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 3
                      i32.load offset=8
                      local.tee 3
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=5716
                      local.tee 3
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 3
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 0
                    i32.store offset=5716
                  end
                  i32.const 0
                  local.set 3
                  i32.const 0
                  local.get 6
                  i32.store offset=6152
                  i32.const 0
                  local.get 0
                  i32.store offset=6148
                  i32.const 0
                  i32.const -1
                  i32.store offset=5732
                  i32.const 0
                  i32.const 0
                  i32.load offset=6172
                  i32.store offset=5736
                  i32.const 0
                  i32.const 0
                  i32.store offset=6160
                  loop  ;; label = @8
                    local.get 3
                    i32.const 5760
                    i32.add
                    local.get 3
                    i32.const 5748
                    i32.add
                    local.tee 4
                    i32.store
                    local.get 4
                    local.get 3
                    i32.const 5740
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 3
                    i32.const 5752
                    i32.add
                    local.get 5
                    i32.store
                    local.get 3
                    i32.const 5768
                    i32.add
                    local.get 3
                    i32.const 5756
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    local.get 4
                    i32.store
                    local.get 3
                    i32.const 5776
                    i32.add
                    local.get 3
                    i32.const 5764
                    i32.add
                    local.tee 4
                    i32.store
                    local.get 4
                    local.get 5
                    i32.store
                    local.get 3
                    i32.const 5772
                    i32.add
                    local.get 4
                    i32.store
                    local.get 3
                    i32.const 32
                    i32.add
                    local.tee 3
                    i32.const 256
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 0
                  i32.const -8
                  local.get 0
                  i32.sub
                  i32.const 15
                  i32.and
                  i32.const 0
                  local.get 0
                  i32.const 8
                  i32.add
                  i32.const 15
                  i32.and
                  select
                  local.tee 3
                  i32.add
                  local.tee 4
                  local.get 6
                  i32.const -56
                  i32.add
                  local.tee 5
                  local.get 3
                  i32.sub
                  local.tee 3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=6188
                  i32.store offset=5728
                  i32.const 0
                  local.get 3
                  i32.store offset=5712
                  i32.const 0
                  local.get 4
                  i32.store offset=5724
                  local.get 0
                  local.get 5
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load8_u offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 5
                local.get 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 0
                local.get 4
                i32.le_u
                br_if 0 (;@6;)
                local.get 4
                i32.const -8
                local.get 4
                i32.sub
                i32.const 15
                i32.and
                i32.const 0
                local.get 4
                i32.const 8
                i32.add
                i32.const 15
                i32.and
                select
                local.tee 5
                i32.add
                local.tee 0
                i32.const 0
                i32.load offset=5712
                local.get 6
                i32.add
                local.tee 11
                local.get 5
                i32.sub
                local.tee 5
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 3
                local.get 8
                local.get 6
                i32.add
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=6188
                i32.store offset=5728
                i32.const 0
                local.get 5
                i32.store offset=5712
                i32.const 0
                local.get 0
                i32.store offset=5724
                local.get 4
                local.get 11
                i32.add
                i32.const 56
                i32.store offset=4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 0
                i32.load offset=5716
                local.tee 8
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                i32.store offset=5716
                local.get 0
                local.set 8
              end
              local.get 0
              local.get 6
              i32.add
              local.set 5
              i32.const 6148
              local.set 3
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 3
                              i32.load
                              local.get 5
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 3
                              i32.load offset=8
                              local.tee 3
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 3
                          i32.load8_u offset=12
                          i32.const 8
                          i32.and
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        i32.const 6148
                        local.set 3
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 3
                            i32.load
                            local.tee 5
                            local.get 4
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 5
                            local.get 3
                            i32.load offset=4
                            i32.add
                            local.tee 5
                            local.get 4
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 3
                          br 0 (;@11;)
                        end
                      end
                      local.get 3
                      local.get 0
                      i32.store
                      local.get 3
                      local.get 3
                      i32.load offset=4
                      local.get 6
                      i32.add
                      i32.store offset=4
                      local.get 0
                      i32.const -8
                      local.get 0
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 0
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 11
                      local.get 2
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 5
                      i32.const -8
                      local.get 5
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 5
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 6
                      local.get 11
                      local.get 2
                      i32.add
                      local.tee 2
                      i32.sub
                      local.set 5
                      block  ;; label = @10
                        local.get 4
                        local.get 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 2
                        i32.store offset=5724
                        i32.const 0
                        i32.const 0
                        i32.load offset=5712
                        local.get 5
                        i32.add
                        local.tee 3
                        i32.store offset=5712
                        local.get 2
                        local.get 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=5720
                        local.get 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 2
                        i32.store offset=5720
                        i32.const 0
                        i32.const 0
                        i32.load offset=5708
                        local.get 5
                        i32.add
                        local.tee 3
                        i32.store offset=5708
                        local.get 2
                        local.get 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 2
                        local.get 3
                        i32.add
                        local.get 3
                        i32.store
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 6
                        i32.load offset=4
                        local.tee 3
                        i32.const 3
                        i32.and
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 3
                        i32.const -8
                        i32.and
                        local.set 7
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 3
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=8
                            local.tee 4
                            local.get 3
                            i32.const 3
                            i32.shr_u
                            local.tee 8
                            i32.const 3
                            i32.shl
                            i32.const 5740
                            i32.add
                            local.tee 0
                            i32.eq
                            drop
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 3
                              local.get 4
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=5700
                              i32.const -2
                              local.get 8
                              i32.rotl
                              i32.and
                              i32.store offset=5700
                              br 2 (;@11;)
                            end
                            local.get 3
                            local.get 0
                            i32.eq
                            drop
                            local.get 3
                            local.get 4
                            i32.store offset=8
                            local.get 4
                            local.get 3
                            i32.store offset=12
                            br 1 (;@11;)
                          end
                          local.get 6
                          i32.load offset=24
                          local.set 9
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 0
                              local.get 6
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 8
                              local.get 6
                              i32.load offset=8
                              local.tee 3
                              i32.gt_u
                              drop
                              local.get 0
                              local.get 3
                              i32.store offset=8
                              local.get 3
                              local.get 0
                              i32.store offset=12
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 6
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 16
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 0
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 3
                              local.set 8
                              local.get 4
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 3
                              local.get 0
                              i32.load offset=16
                              local.tee 4
                              br_if 0 (;@13;)
                            end
                            local.get 8
                            i32.const 0
                            i32.store
                          end
                          local.get 9
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=28
                              local.tee 4
                              i32.const 2
                              i32.shl
                              i32.const 6004
                              i32.add
                              local.tee 3
                              i32.load
                              local.get 6
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 0
                              i32.store
                              local.get 0
                              br_if 1 (;@12;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=5704
                              i32.const -2
                              local.get 4
                              i32.rotl
                              i32.and
                              i32.store offset=5704
                              br 2 (;@11;)
                            end
                            local.get 9
                            i32.const 16
                            i32.const 20
                            local.get 9
                            i32.load offset=16
                            local.get 6
                            i32.eq
                            select
                            i32.add
                            local.get 0
                            i32.store
                            local.get 0
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          local.get 0
                          local.get 9
                          i32.store offset=24
                          block  ;; label = @12
                            local.get 6
                            i32.load offset=16
                            local.tee 3
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 3
                            i32.store offset=16
                            local.get 3
                            local.get 0
                            i32.store offset=24
                          end
                          local.get 6
                          i32.load offset=20
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 20
                          i32.add
                          local.get 3
                          i32.store
                          local.get 3
                          local.get 0
                          i32.store offset=24
                        end
                        local.get 7
                        local.get 5
                        i32.add
                        local.set 5
                        local.get 6
                        local.get 7
                        i32.add
                        local.set 6
                      end
                      local.get 6
                      local.get 6
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 2
                      local.get 5
                      i32.add
                      local.get 5
                      i32.store
                      local.get 2
                      local.get 5
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      block  ;; label = @10
                        local.get 5
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 3
                        i32.shr_u
                        local.tee 4
                        i32.const 3
                        i32.shl
                        i32.const 5740
                        i32.add
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=5700
                            local.tee 5
                            i32.const 1
                            local.get 4
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 5
                            local.get 4
                            i32.or
                            i32.store offset=5700
                            local.get 3
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 4
                        local.get 2
                        i32.store offset=12
                        local.get 3
                        local.get 2
                        i32.store offset=8
                        local.get 2
                        local.get 3
                        i32.store offset=12
                        local.get 2
                        local.get 4
                        i32.store offset=8
                        br 3 (;@7;)
                      end
                      i32.const 31
                      local.set 3
                      block  ;; label = @10
                        local.get 5
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 8
                        i32.shr_u
                        local.tee 3
                        local.get 3
                        i32.const 1048320
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 8
                        i32.and
                        local.tee 3
                        i32.shl
                        local.tee 4
                        local.get 4
                        i32.const 520192
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 4
                        i32.and
                        local.tee 4
                        i32.shl
                        local.tee 0
                        local.get 0
                        i32.const 245760
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 2
                        i32.and
                        local.tee 0
                        i32.shl
                        i32.const 15
                        i32.shr_u
                        local.get 3
                        local.get 4
                        i32.or
                        local.get 0
                        i32.or
                        i32.sub
                        local.tee 3
                        i32.const 1
                        i32.shl
                        local.get 5
                        local.get 3
                        i32.const 21
                        i32.add
                        i32.shr_u
                        i32.const 1
                        i32.and
                        i32.or
                        i32.const 28
                        i32.add
                        local.set 3
                      end
                      local.get 2
                      local.get 3
                      i32.store offset=28
                      local.get 2
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 3
                      i32.const 2
                      i32.shl
                      i32.const 6004
                      i32.add
                      local.set 4
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=5704
                        local.tee 0
                        i32.const 1
                        local.get 3
                        i32.shl
                        local.tee 8
                        i32.and
                        br_if 0 (;@10;)
                        local.get 4
                        local.get 2
                        i32.store
                        i32.const 0
                        local.get 0
                        local.get 8
                        i32.or
                        i32.store offset=5704
                        local.get 2
                        local.get 4
                        i32.store offset=24
                        local.get 2
                        local.get 2
                        i32.store offset=8
                        local.get 2
                        local.get 2
                        i32.store offset=12
                        br 3 (;@7;)
                      end
                      local.get 5
                      i32.const 0
                      i32.const 25
                      local.get 3
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 3
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 3
                      local.get 4
                      i32.load
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        local.tee 4
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 5
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 29
                        i32.shr_u
                        local.set 0
                        local.get 3
                        i32.const 1
                        i32.shl
                        local.set 3
                        local.get 4
                        local.get 0
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 8
                        i32.load
                        local.tee 0
                        br_if 0 (;@10;)
                      end
                      local.get 8
                      local.get 2
                      i32.store
                      local.get 2
                      local.get 4
                      i32.store offset=24
                      local.get 2
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 2
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    local.get 0
                    i32.const -8
                    local.get 0
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 0
                    i32.const 8
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    local.tee 3
                    i32.add
                    local.tee 11
                    local.get 6
                    i32.const -56
                    i32.add
                    local.tee 8
                    local.get 3
                    i32.sub
                    local.tee 3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 8
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 4
                    local.get 5
                    i32.const 55
                    local.get 5
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 5
                    i32.const -55
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 8
                    local.get 8
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 8
                    i32.const 35
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=6188
                    i32.store offset=5728
                    i32.const 0
                    local.get 3
                    i32.store offset=5712
                    i32.const 0
                    local.get 11
                    i32.store offset=5724
                    local.get 8
                    i32.const 16
                    i32.add
                    i32.const 0
                    i64.load offset=6156 align=4
                    i64.store align=4
                    local.get 8
                    i32.const 0
                    i64.load offset=6148 align=4
                    i64.store offset=8 align=4
                    i32.const 0
                    local.get 8
                    i32.const 8
                    i32.add
                    i32.store offset=6156
                    i32.const 0
                    local.get 6
                    i32.store offset=6152
                    i32.const 0
                    local.get 0
                    i32.store offset=6148
                    i32.const 0
                    i32.const 0
                    i32.store offset=6160
                    local.get 8
                    i32.const 36
                    i32.add
                    local.set 3
                    loop  ;; label = @9
                      local.get 3
                      i32.const 7
                      i32.store
                      local.get 5
                      local.get 3
                      i32.const 4
                      i32.add
                      local.tee 3
                      i32.gt_u
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    local.get 4
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 8
                    local.get 8
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 8
                    local.get 8
                    local.get 4
                    i32.sub
                    local.tee 6
                    i32.store
                    local.get 4
                    local.get 6
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block  ;; label = @9
                      local.get 6
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 6
                      i32.const 3
                      i32.shr_u
                      local.tee 5
                      i32.const 3
                      i32.shl
                      i32.const 5740
                      i32.add
                      local.set 3
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=5700
                          local.tee 0
                          i32.const 1
                          local.get 5
                          i32.shl
                          local.tee 5
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 0
                          local.get 5
                          i32.or
                          i32.store offset=5700
                          local.get 3
                          local.set 5
                          br 1 (;@10;)
                        end
                        local.get 3
                        i32.load offset=8
                        local.set 5
                      end
                      local.get 5
                      local.get 4
                      i32.store offset=12
                      local.get 3
                      local.get 4
                      i32.store offset=8
                      local.get 4
                      local.get 3
                      i32.store offset=12
                      local.get 4
                      local.get 5
                      i32.store offset=8
                      br 4 (;@5;)
                    end
                    i32.const 31
                    local.set 3
                    block  ;; label = @9
                      local.get 6
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 6
                      i32.const 8
                      i32.shr_u
                      local.tee 3
                      local.get 3
                      i32.const 1048320
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 8
                      i32.and
                      local.tee 3
                      i32.shl
                      local.tee 5
                      local.get 5
                      i32.const 520192
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 4
                      i32.and
                      local.tee 5
                      i32.shl
                      local.tee 0
                      local.get 0
                      i32.const 245760
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 2
                      i32.and
                      local.tee 0
                      i32.shl
                      i32.const 15
                      i32.shr_u
                      local.get 3
                      local.get 5
                      i32.or
                      local.get 0
                      i32.or
                      i32.sub
                      local.tee 3
                      i32.const 1
                      i32.shl
                      local.get 6
                      local.get 3
                      i32.const 21
                      i32.add
                      i32.shr_u
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 28
                      i32.add
                      local.set 3
                    end
                    local.get 4
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 4
                    i32.const 28
                    i32.add
                    local.get 3
                    i32.store
                    local.get 3
                    i32.const 2
                    i32.shl
                    i32.const 6004
                    i32.add
                    local.set 5
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=5704
                      local.tee 0
                      i32.const 1
                      local.get 3
                      i32.shl
                      local.tee 8
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 4
                      i32.store
                      i32.const 0
                      local.get 0
                      local.get 8
                      i32.or
                      i32.store offset=5704
                      local.get 4
                      i32.const 24
                      i32.add
                      local.get 5
                      i32.store
                      local.get 4
                      local.get 4
                      i32.store offset=8
                      local.get 4
                      local.get 4
                      i32.store offset=12
                      br 4 (;@5;)
                    end
                    local.get 6
                    i32.const 0
                    i32.const 25
                    local.get 3
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 3
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 3
                    local.get 5
                    i32.load
                    local.set 0
                    loop  ;; label = @9
                      local.get 0
                      local.tee 5
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 6
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 3
                      i32.const 29
                      i32.shr_u
                      local.set 0
                      local.get 3
                      i32.const 1
                      i32.shl
                      local.set 3
                      local.get 5
                      local.get 0
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 8
                      i32.load
                      local.tee 0
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    local.get 4
                    i32.store
                    local.get 4
                    i32.const 24
                    i32.add
                    local.get 5
                    i32.store
                    local.get 4
                    local.get 4
                    i32.store offset=12
                    local.get 4
                    local.get 4
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  local.get 4
                  i32.load offset=8
                  local.tee 3
                  local.get 2
                  i32.store offset=12
                  local.get 4
                  local.get 2
                  i32.store offset=8
                  local.get 2
                  i32.const 0
                  i32.store offset=24
                  local.get 2
                  local.get 4
                  i32.store offset=12
                  local.get 2
                  local.get 3
                  i32.store offset=8
                end
                local.get 11
                i32.const 8
                i32.add
                local.set 3
                br 5 (;@1;)
              end
              local.get 5
              i32.load offset=8
              local.tee 3
              local.get 4
              i32.store offset=12
              local.get 5
              local.get 4
              i32.store offset=8
              local.get 4
              i32.const 24
              i32.add
              i32.const 0
              i32.store
              local.get 4
              local.get 5
              i32.store offset=12
              local.get 4
              local.get 3
              i32.store offset=8
            end
            i32.const 0
            i32.load offset=5712
            local.tee 3
            local.get 2
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=5724
            local.tee 4
            local.get 2
            i32.add
            local.tee 5
            local.get 3
            local.get 2
            i32.sub
            local.tee 3
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.get 3
            i32.store offset=5712
            i32.const 0
            local.get 5
            i32.store offset=5724
            local.get 4
            local.get 2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 4
            i32.const 8
            i32.add
            local.set 3
            br 3 (;@1;)
          end
          i32.const 0
          local.set 3
          i32.const 0
          i32.const 48
          i32.store offset=5696
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              local.get 8
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 6004
              i32.add
              local.tee 3
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 3
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              local.get 7
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              local.tee 7
              i32.store offset=5704
              br 2 (;@3;)
            end
            local.get 11
            i32.const 16
            i32.const 20
            local.get 11
            i32.load offset=16
            local.get 8
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 11
          i32.store offset=24
          block  ;; label = @4
            local.get 8
            i32.load offset=16
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            i32.store offset=16
            local.get 3
            local.get 0
            i32.store offset=24
          end
          local.get 8
          i32.const 20
          i32.add
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 20
          i32.add
          local.get 3
          i32.store
          local.get 3
          local.get 0
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 4
            local.get 2
            i32.add
            local.tee 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 3
            i32.add
            local.tee 3
            local.get 3
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 8
          local.get 2
          i32.add
          local.tee 0
          local.get 4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 8
          local.get 2
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.get 4
          i32.store
          block  ;; label = @4
            local.get 4
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 3
            i32.shr_u
            local.tee 4
            i32.const 3
            i32.shl
            i32.const 5740
            i32.add
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=5700
                local.tee 5
                i32.const 1
                local.get 4
                i32.shl
                local.tee 4
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 4
                i32.or
                i32.store offset=5700
                local.get 3
                local.set 4
                br 1 (;@5;)
              end
              local.get 3
              i32.load offset=8
              local.set 4
            end
            local.get 4
            local.get 0
            i32.store offset=12
            local.get 3
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=12
            local.get 0
            local.get 4
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 3
          block  ;; label = @4
            local.get 4
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 8
            i32.shr_u
            local.tee 3
            local.get 3
            i32.const 1048320
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 8
            i32.and
            local.tee 3
            i32.shl
            local.tee 5
            local.get 5
            i32.const 520192
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 4
            i32.and
            local.tee 5
            i32.shl
            local.tee 2
            local.get 2
            i32.const 245760
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 2
            i32.and
            local.tee 2
            i32.shl
            i32.const 15
            i32.shr_u
            local.get 3
            local.get 5
            i32.or
            local.get 2
            i32.or
            i32.sub
            local.tee 3
            i32.const 1
            i32.shl
            local.get 4
            local.get 3
            i32.const 21
            i32.add
            i32.shr_u
            i32.const 1
            i32.and
            i32.or
            i32.const 28
            i32.add
            local.set 3
          end
          local.get 0
          local.get 3
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 3
          i32.const 2
          i32.shl
          i32.const 6004
          i32.add
          local.set 5
          block  ;; label = @4
            local.get 7
            i32.const 1
            local.get 3
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.store
            i32.const 0
            local.get 7
            local.get 2
            i32.or
            i32.store offset=5704
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 4
          i32.const 0
          i32.const 25
          local.get 3
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 3
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 3
          local.get 5
          i32.load
          local.set 2
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              local.tee 5
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 4
              i32.eq
              br_if 1 (;@4;)
              local.get 3
              i32.const 29
              i32.shr_u
              local.set 2
              local.get 3
              i32.const 1
              i32.shl
              local.set 3
              local.get 5
              local.get 2
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 6
              i32.load
              local.tee 2
              br_if 0 (;@5;)
            end
            local.get 6
            local.get 0
            i32.store
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=8
          local.tee 3
          local.get 0
          i32.store offset=12
          local.get 5
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 0
          local.get 3
          i32.store offset=8
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 6004
            i32.add
            local.tee 3
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            local.get 8
            i32.store
            local.get 8
            br_if 1 (;@3;)
            i32.const 0
            local.get 9
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=5704
            br 2 (;@2;)
          end
          local.get 10
          i32.const 16
          i32.const 20
          local.get 10
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 8
          i32.store
          local.get 8
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 8
        local.get 10
        i32.store offset=24
        block  ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          local.get 3
          i32.store offset=16
          local.get 3
          local.get 8
          i32.store offset=24
        end
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        i32.const 20
        i32.add
        local.get 3
        i32.store
        local.get 3
        local.get 8
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          local.get 2
          i32.add
          local.tee 3
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.tee 3
          local.get 3
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 2
        i32.add
        local.tee 5
        local.get 4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 2
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 5
        local.get 4
        i32.add
        local.get 4
        i32.store
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          i32.const 3
          i32.shr_u
          local.tee 8
          i32.const 3
          i32.shl
          i32.const 5740
          i32.add
          local.set 2
          i32.const 0
          i32.load offset=5720
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 8
              i32.shl
              local.tee 8
              local.get 6
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 8
              local.get 6
              i32.or
              i32.store offset=5700
              local.get 2
              local.set 8
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.set 8
          end
          local.get 8
          local.get 3
          i32.store offset=12
          local.get 2
          local.get 3
          i32.store offset=8
          local.get 3
          local.get 2
          i32.store offset=12
          local.get 3
          local.get 8
          i32.store offset=8
        end
        i32.const 0
        local.get 5
        i32.store offset=5720
        i32.const 0
        local.get 4
        i32.store offset=5708
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 3
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $free (type 11) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 11) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=5716
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          i32.const 0
          i32.load offset=5720
          local.get 1
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 2
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=8
            local.tee 4
            local.get 2
            i32.const 3
            i32.shr_u
            local.tee 5
            i32.const 3
            i32.shl
            i32.const 5740
            i32.add
            local.tee 6
            i32.eq
            drop
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 2
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=5700
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=5700
              br 3 (;@2;)
            end
            local.get 2
            local.get 6
            i32.eq
            drop
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 2
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 1
          i32.load offset=24
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 6
              local.get 1
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              local.get 1
              i32.load offset=8
              local.tee 2
              i32.gt_u
              drop
              local.get 6
              local.get 2
              i32.store offset=8
              local.get 2
              local.get 6
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 1
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 1
              i32.const 16
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 2
              local.set 5
              local.get 4
              local.tee 6
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.load offset=16
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 7
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 6004
              i32.add
              local.tee 2
              i32.load
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=5704
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=5704
              br 3 (;@2;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block  ;; label = @4
            local.get 1
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        i32.const 0
        local.get 0
        i32.store offset=5708
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        return
      end
      local.get 3
      local.get 1
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            i32.const 0
            i32.load offset=5724
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=5724
            i32.const 0
            i32.const 0
            i32.load offset=5712
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=5712
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.load offset=5720
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=5708
            i32.const 0
            i32.const 0
            i32.store offset=5720
            return
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=5720
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=5720
            i32.const 0
            i32.const 0
            i32.load offset=5708
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=5708
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            return
          end
          local.get 2
          i32.const -8
          i32.and
          local.get 0
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=8
              local.tee 4
              local.get 2
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 5740
              i32.add
              local.tee 6
              i32.eq
              drop
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 2
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=5700
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=5700
                br 2 (;@4;)
              end
              local.get 2
              local.get 6
              i32.eq
              drop
              local.get 2
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 2
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 6
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=5716
                local.get 3
                i32.load offset=8
                local.tee 2
                i32.gt_u
                drop
                local.get 6
                local.get 2
                i32.store offset=8
                local.get 2
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 3
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 2
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 2
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 6004
                i32.add
                local.tee 2
                i32.load
                local.get 3
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=5704
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=5704
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 3
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 3
              i32.load offset=16
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 2
              i32.store offset=16
              local.get 2
              local.get 6
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 2
            i32.store
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=5720
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=5708
          return
        end
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.shr_u
        local.tee 2
        i32.const 3
        i32.shl
        i32.const 5740
        i32.add
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=5700
            local.tee 4
            i32.const 1
            local.get 2
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 2
            i32.or
            i32.store offset=5700
            local.get 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 0
          i32.load offset=8
          local.set 2
        end
        local.get 2
        local.get 1
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 1
        local.get 2
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 8
        i32.shr_u
        local.tee 2
        local.get 2
        i32.const 1048320
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 8
        i32.and
        local.tee 2
        i32.shl
        local.tee 4
        local.get 4
        i32.const 520192
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 4
        i32.and
        local.tee 4
        i32.shl
        local.tee 6
        local.get 6
        i32.const 245760
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 2
        i32.and
        local.tee 6
        i32.shl
        i32.const 15
        i32.shr_u
        local.get 2
        local.get 4
        i32.or
        local.get 6
        i32.or
        i32.sub
        local.tee 2
        i32.const 1
        i32.shl
        local.get 0
        local.get 2
        i32.const 21
        i32.add
        i32.shr_u
        i32.const 1
        i32.and
        i32.or
        i32.const 28
        i32.add
        local.set 2
      end
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 1
      i32.const 28
      i32.add
      local.get 2
      i32.store
      local.get 2
      i32.const 2
      i32.shl
      i32.const 6004
      i32.add
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=5704
          local.tee 6
          i32.const 1
          local.get 2
          i32.shl
          local.tee 3
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.store
          i32.const 0
          local.get 6
          local.get 3
          i32.or
          i32.store offset=5704
          local.get 1
          i32.const 24
          i32.add
          local.get 4
          i32.store
          local.get 1
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 1
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 2
        local.get 4
        i32.load
        local.set 6
        block  ;; label = @3
          loop  ;; label = @4
            local.get 6
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 6
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 4
            local.get 6
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 3
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i32.store
          local.get 1
          i32.const 24
          i32.add
          local.get 4
          i32.store
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 24
        i32.add
        i32.const 0
        i32.store
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
      end
      i32.const 0
      i32.const 0
      i32.load offset=5732
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=5732
    end)
  (func $calloc (type 3) (param i32 i32) (result i32)
    (local i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i64.extend_i32_u
      local.get 1
      i64.extend_i32_u
      i64.mul
      local.tee 3
      i32.wrap_i64
      local.set 2
      local.get 1
      local.get 0
      i32.or
      i32.const 65536
      i32.lt_u
      br_if 0 (;@1;)
      i32.const -1
      local.get 2
      local.get 3
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.const 0
      i32.ne
      select
      local.set 2
    end
    block  ;; label = @1
      local.get 2
      call $dlmalloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0)
  (func $_Exit (type 11) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $internal_register_preopened_fd (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 2
        i32.add
        br_table 1 (;@1;) 1 (;@1;) 0 (;@2;)
      end
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=6196
        local.tee 2
        i32.const 0
        i32.load offset=6204
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=6200
        local.set 3
        block  ;; label = @3
          i32.const 8
          local.get 2
          i32.const 1
          i32.shl
          i32.const 4
          local.get 2
          select
          local.tee 4
          call $calloc
          local.tee 5
          br_if 0 (;@3;)
          i32.const -1
          return
        end
        local.get 5
        local.get 3
        local.get 2
        i32.const 3
        i32.shl
        call $memcpy
        local.set 5
        i32.const 0
        local.get 4
        i32.store offset=6204
        i32.const 0
        local.get 5
        i32.store offset=6200
        local.get 3
        call $free
      end
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.tee 3
              i32.load8_u
              i32.const -46
              i32.add
              br_table 1 (;@4;) 0 (;@5;) 3 (;@2;)
            end
            local.get 3
            i32.const 1
            i32.add
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          i32.const 1
          i32.add
          local.set 1
          local.get 3
          i32.load8_u offset=1
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 47
          i32.ne
          br_if 1 (;@2;)
          local.get 3
          i32.const 2
          i32.add
          local.set 1
          br 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 3
        call $strdup
        local.tee 3
        br_if 0 (;@2;)
        i32.const -1
        return
      end
      i32.const 0
      local.get 2
      i32.const 1
      i32.add
      i32.store offset=6196
      i32.const 0
      i32.load offset=6200
      local.get 2
      i32.const 3
      i32.shl
      i32.add
      local.tee 1
      local.get 0
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store
      i32.const 0
      return
    end
    call $abort
    unreachable)
  (func $__wasilibc_find_relpath (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 3
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        local.get 4
        i32.const 12
        i32.add
        i32.const 0
        call $undefined_weak:__wasilibc_find_relpath_alloc
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      local.get 2
      call $__wasilibc_find_abspath
      local.set 0
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $__wasilibc_find_abspath (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const -1
    i32.add
    local.set 3
    loop  ;; label = @1
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.load8_u
      i32.const 47
      i32.eq
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=6196
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=6200
        local.set 6
        i32.const -1
        local.set 7
        loop  ;; label = @3
          local.get 6
          local.get 5
          i32.const -1
          i32.add
          local.tee 5
          i32.const 3
          i32.shl
          i32.add
          local.tee 8
          i32.load
          local.tee 9
          call $strlen
          local.set 10
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const -1
              i32.eq
              br_if 0 (;@5;)
              local.get 10
              local.get 4
              i32.le_u
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 10
                br_if 0 (;@6;)
                local.get 3
                i32.load8_u
                i32.const 255
                i32.and
                i32.const 47
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 3
              local.get 9
              local.get 10
              call $memcmp
              br_if 1 (;@4;)
              local.get 9
              i32.const -1
              i32.add
              local.set 11
              local.get 10
              local.set 12
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 12
                  local.tee 0
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 0
                  i32.const -1
                  i32.add
                  local.set 12
                  local.get 11
                  local.get 0
                  i32.add
                  i32.load8_u
                  i32.const 47
                  i32.eq
                  br_if 0 (;@7;)
                end
              end
              local.get 3
              local.get 0
              i32.add
              i32.load8_u
              local.tee 0
              i32.const 47
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              br_if 1 (;@4;)
            end
            local.get 1
            local.get 9
            i32.store
            local.get 8
            i32.load offset=4
            local.set 7
            local.get 10
            local.set 4
          end
          local.get 5
          br_if 0 (;@3;)
        end
        local.get 7
        i32.const -1
        i32.ne
        br_if 1 (;@1;)
      end
      i32.const 0
      i32.const 44
      i32.store offset=5696
      i32.const -1
      return
    end
    local.get 3
    local.get 4
    i32.add
    i32.const -1
    i32.add
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.load8_u
      local.tee 3
      i32.const 47
      i32.eq
      br_if 0 (;@1;)
    end
    local.get 2
    local.get 0
    i32.const 1553
    local.get 3
    select
    i32.store
    local.get 7)
  (func $__wasilibc_populate_preopens (type 12)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 3
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 0
            i32.const 8
            i32.add
            call $__wasi_fd_prestat_get
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 8
            i32.ne
            br_if 2 (;@2;)
            local.get 0
            i32.const 16
            i32.add
            global.set $__stack_pointer
            return
          end
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=8
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=12
            local.tee 3
            i32.const 1
            i32.add
            call $malloc
            local.tee 2
            i32.eqz
            br_if 3 (;@1;)
            local.get 1
            local.get 2
            local.get 3
            call $__wasi_fd_prestat_dir_name
            br_if 2 (;@2;)
            local.get 2
            local.get 0
            i32.load offset=12
            i32.add
            i32.const 0
            i32.store8
            local.get 1
            local.get 2
            call $internal_register_preopened_fd
            br_if 3 (;@1;)
            local.get 2
            call $free
          end
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          br 0 (;@3;)
        end
      end
      i32.const 71
      call $_Exit
      unreachable
    end
    i32.const 70
    call $_Exit
    unreachable)
  (func $__wasilibc_nocwd_openat_nomode (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 503316480
            i32.and
            i32.const -33554432
            i32.add
            i32.const 25
            i32.shr_u
            local.tee 4
            i32.const 9
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 1
            local.get 4
            i32.shl
            local.tee 4
            i32.const 642
            i32.and
            br_if 1 (;@3;)
            i64.const -4211012
            local.set 5
            local.get 4
            i32.const 9
            i32.and
            br_if 2 (;@2;)
          end
          i32.const 0
          i32.const 28
          i32.store offset=5696
          i32.const -1
          local.set 4
          br 2 (;@1;)
        end
        i64.const -4194626
        i64.const -4211012
        local.get 2
        i32.const 67108864
        i32.and
        select
        local.tee 5
        i64.const 4194625
        i64.or
        local.get 5
        local.get 2
        i32.const 268435456
        i32.and
        select
        local.set 5
      end
      block  ;; label = @2
        local.get 0
        local.get 3
        i32.const 8
        i32.add
        call $__wasi_fd_fdstat_get
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 4
        i32.store offset=5696
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      i32.const -1
      local.set 4
      block  ;; label = @2
        local.get 0
        local.get 2
        i32.const 24
        i32.shr_u
        i32.const -1
        i32.xor
        i32.const 1
        i32.and
        local.get 1
        local.get 2
        i32.const 12
        i32.shr_u
        i32.const 4095
        i32.and
        local.get 3
        i64.load offset=24
        local.tee 6
        local.get 5
        i64.and
        local.get 6
        local.get 2
        i32.const 4095
        i32.and
        local.get 3
        i32.const 4
        i32.add
        call $__wasi_path_open
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 2
        i32.store offset=5696
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=4
      local.set 4
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $__wasilibc_nocwd_fstatat (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i64 i64 i64 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const -1
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 3
        i32.const -1
        i32.xor
        i32.const 1
        i32.and
        local.get 1
        local.get 4
        call $__wasi_path_filestat_get
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=5696
        br 1 (;@1;)
      end
      local.get 2
      i64.const 0
      i64.store offset=24
      local.get 2
      local.get 4
      i64.load offset=24
      i64.store offset=16
      local.get 2
      local.get 4
      i64.load offset=8
      i64.store offset=8
      local.get 2
      local.get 4
      i64.load
      i64.store
      local.get 2
      i64.const 0
      i64.store offset=64
      i32.const 0
      local.set 5
      local.get 2
      i32.const 0
      i32.store offset=56
      local.get 2
      local.get 4
      i64.load offset=32
      i64.store offset=48
      local.get 4
      i32.const 80
      i32.add
      i64.const 0
      i64.store align=4
      local.get 4
      i32.const 88
      i32.add
      i64.const 0
      i64.store align=4
      local.get 2
      i32.const 32
      i32.add
      i64.const 0
      i64.store
      local.get 2
      i32.const 40
      i32.add
      i64.const 0
      i64.store
      local.get 2
      local.get 4
      i64.load offset=56
      local.tee 6
      i64.const 1000000000
      i64.div_u
      local.tee 7
      i64.store offset=104
      local.get 2
      local.get 4
      i64.load offset=48
      local.tee 8
      i64.const 1000000000
      i64.div_u
      local.tee 9
      i64.store offset=88
      local.get 2
      local.get 4
      i64.load offset=40
      local.tee 10
      i64.const 1000000000
      i64.div_u
      local.tee 11
      i64.store offset=72
      local.get 2
      i32.const 112
      i32.add
      local.get 6
      local.get 7
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32
      local.get 2
      i32.const 96
      i32.add
      local.get 8
      local.get 9
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32
      local.get 2
      i32.const 80
      i32.add
      local.get 10
      local.get 11
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32
      local.get 4
      i64.const 0
      i64.store offset=72 align=4
      local.get 2
      i32.const 140
      i32.add
      local.get 4
      i32.const 68
      i32.add
      i32.const 24
      i32.add
      i32.load
      i32.store
      local.get 2
      i32.const 132
      i32.add
      local.get 4
      i32.const 84
      i32.add
      i64.load align=4
      i64.store align=4
      local.get 2
      i32.const 124
      i32.add
      local.get 4
      i32.const 76
      i32.add
      i64.load align=4
      i64.store align=4
      local.get 2
      local.get 4
      i64.load offset=68 align=4
      i64.store offset=116 align=4
      local.get 4
      i32.load8_u offset=16
      i32.const -1
      i32.add
      local.tee 0
      i32.const 255
      i32.and
      i32.const 6
      i32.gt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const 24
      i32.add
      local.get 0
      i32.const 24
      i32.shl
      i32.const 24
      i32.shr_s
      i32.const 2
      i32.shl
      i32.const 3236
      i32.add
      i32.load
      i32.store
    end
    local.get 4
    i32.const 96
    i32.add
    global.set $__stack_pointer
    local.get 5)
  (func $__wasilibc_nocwd_mkdirat_nomode (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      call $__wasi_path_create_directory
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 0
    i32.store offset=5696
    i32.const -1)
  (func $close (type 0) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      call $__wasi_fd_close
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 0
    i32.store offset=5696
    i32.const -1)
  (func $__wasilibc_open_nomode (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        i32.const 12
        i32.add
        i32.const 6208
        i32.const 6212
        i32.const 1
        call $undefined_weak:__wasilibc_find_relpath_alloc
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.const 12
      i32.add
      i32.const 6208
      i32.const 0
      i32.load offset=6212
      call $__wasilibc_find_relpath
      local.set 3
    end
    i32.const -1
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 76
        i32.store offset=5696
        br 1 (;@1;)
      end
      local.get 3
      i32.const 0
      i32.load offset=6208
      local.get 1
      call $__wasilibc_nocwd_openat_nomode
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $stat (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        i32.const 12
        i32.add
        i32.const 6208
        i32.const 6212
        i32.const 1
        call $undefined_weak:__wasilibc_find_relpath_alloc
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.const 12
      i32.add
      i32.const 6208
      i32.const 0
      i32.load offset=6212
      call $__wasilibc_find_relpath
      local.set 3
    end
    i32.const -1
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 76
        i32.store offset=5696
        br 1 (;@1;)
      end
      local.get 3
      i32.const 0
      i32.load offset=6208
      local.get 1
      i32.const 0
      call $__wasilibc_nocwd_fstatat
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $remove (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.const 12
        i32.add
        i32.const 6208
        i32.const 6212
        i32.const 1
        call $undefined_weak:__wasilibc_find_relpath_alloc
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      i32.const 12
      i32.add
      i32.const 6208
      i32.const 0
      i32.load offset=6212
      call $__wasilibc_find_relpath
      local.set 2
    end
    i32.const -1
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -1
        i32.eq
        br_if 0 (;@2;)
        i32.const 0
        local.set 0
        local.get 2
        i32.const 0
        i32.load offset=6208
        local.tee 3
        call $__wasilibc_nocwd___wasilibc_unlinkat
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=5696
          local.tee 5
          i32.const 76
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.set 0
          local.get 5
          i32.const 31
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 2
        local.get 3
        call $__wasilibc_nocwd___wasilibc_rmdirat
        local.set 0
        i32.const 0
        i32.load offset=5696
        i32.const 54
        i32.ne
        br_if 1 (;@1;)
      end
      i32.const 0
      i32.const 76
      i32.store offset=5696
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $mkdir (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        i32.const 12
        i32.add
        i32.const 6208
        i32.const 6212
        i32.const 1
        call $undefined_weak:__wasilibc_find_relpath_alloc
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.const 12
      i32.add
      i32.const 6208
      i32.const 0
      i32.load offset=6212
      call $__wasilibc_find_relpath
      local.set 3
    end
    i32.const -1
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 76
        i32.store offset=5696
        br 1 (;@1;)
      end
      local.get 3
      i32.const 0
      i32.load offset=6208
      call $__wasilibc_nocwd_mkdirat_nomode
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $sbrk (type 0) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=5696
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable)
  (func $__wasilibc_nocwd___wasilibc_rmdirat (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      call $__wasi_path_remove_directory
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 0
    i32.store offset=5696
    i32.const -1)
  (func $__main_void (type 14) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 8
              i32.add
              local.get 0
              i32.const 12
              i32.add
              call $__wasi_args_sizes_get
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=8
              local.tee 1
              i32.const 1
              i32.add
              local.tee 2
              local.get 1
              i32.lt_u
              br_if 1 (;@4;)
              local.get 0
              i32.load offset=12
              call $malloc
              local.tee 3
              i32.eqz
              br_if 2 (;@3;)
              local.get 2
              i32.const 4
              call $calloc
              local.tee 1
              i32.eqz
              br_if 3 (;@2;)
              local.get 1
              local.get 3
              call $__wasi_args_get
              br_if 4 (;@1;)
              local.get 0
              i32.load offset=8
              local.get 1
              call $main
              local.set 1
              local.get 0
              i32.const 16
              i32.add
              global.set $__stack_pointer
              local.get 1
              return
            end
            i32.const 71
            call $_Exit
            unreachable
          end
          i32.const 70
          call $_Exit
          unreachable
        end
        i32.const 70
        call $_Exit
        unreachable
      end
      local.get 3
      call $free
      i32.const 70
      call $_Exit
      unreachable
    end
    local.get 3
    call $free
    local.get 1
    call $free
    i32.const 71
    call $_Exit
    unreachable)
  (func $__wasilibc_nocwd___wasilibc_unlinkat (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      call $__wasi_path_unlink_file
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 0
    i32.store offset=5696
    i32.const -1)
  (func $abort (type 12)
    unreachable
    unreachable)
  (func $__wasi_args_get (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_get
    i32.const 65535
    i32.and)
  (func $__wasi_args_sizes_get (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_sizes_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_allocate (type 4) (param i32 i64 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $__imported_wasi_snapshot_preview1_fd_allocate
    i32.const 65535
    i32.and)
  (func $__wasi_fd_close (type 0) (param i32) (result i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_fd_close
    i32.const 65535
    i32.and)
  (func $__wasi_fd_fdstat_get (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_fdstat_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_fdstat_set_flags (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_fdstat_set_flags
    i32.const 65535
    i32.and)
  (func $__wasi_fd_filestat_get (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_filestat_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_filestat_set_size (type 5) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_filestat_set_size
    i32.const 65535
    i32.and)
  (func $__wasi_fd_pread (type 6) (param i32 i32 i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call $__imported_wasi_snapshot_preview1_fd_pread
    i32.const 65535
    i32.and)
  (func $__wasi_fd_prestat_get (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_prestat_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_prestat_dir_name (type 2) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $__imported_wasi_snapshot_preview1_fd_prestat_dir_name
    i32.const 65535
    i32.and)
  (func $__wasi_fd_pwrite (type 6) (param i32 i32 i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call $__imported_wasi_snapshot_preview1_fd_pwrite
    i32.const 65535
    i32.and)
  (func $__wasi_fd_read (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_read
    i32.const 65535
    i32.and)
  (func $__wasi_fd_seek (type 8) (param i32 i64 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_seek
    i32.const 65535
    i32.and)
  (func $__wasi_fd_write (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_write
    i32.const 65535
    i32.and)
  (func $__wasi_path_create_directory (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call $strlen
    call $__imported_wasi_snapshot_preview1_path_create_directory
    i32.const 65535
    i32.and)
  (func $__wasi_path_filestat_get (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 2
    call $strlen
    local.get 3
    call $__imported_wasi_snapshot_preview1_path_filestat_get
    i32.const 65535
    i32.and)
  (func $__wasi_path_open (type 15) (param i32 i32 i32 i32 i64 i64 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 2
    call $strlen
    local.get 3
    local.get 4
    local.get 5
    local.get 6
    local.get 7
    call $__imported_wasi_snapshot_preview1_path_open
    i32.const 65535
    i32.and)
  (func $__wasi_path_remove_directory (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call $strlen
    call $__imported_wasi_snapshot_preview1_path_remove_directory
    i32.const 65535
    i32.and)
  (func $__wasi_path_unlink_file (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call $strlen
    call $__imported_wasi_snapshot_preview1_path_unlink_file
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 11) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $dummy (type 12))
  (func $__wasm_call_dtors (type 12)
    call $dummy
    call $__stdio_exit)
  (func $exit (type 11) (param i32)
    call $dummy
    call $__stdio_exit
    local.get 0
    call $_Exit
    unreachable)
  (func $__assert_fail (type 16) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 2
    i32.store offset=12
    local.get 4
    local.get 3
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 0
    i32.store
    i32.const 5456
    i32.const 3148
    local.get 4
    call $fprintf
    drop
    call $abort
    unreachable)
  (func $fopen (type 3) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 1171
      local.get 1
      i32.load8_s
      i32.const 4
      call $memchr
      br_if 0 (;@1;)
      i32.const 0
      i32.const 28
      i32.store offset=5696
      i32.const 0
      return
    end
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      local.get 1
      call $__fmodeflags
      call $__wasilibc_open_nomode
      local.tee 0
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      call $__fdopen
      local.tee 2
      br_if 0 (;@1;)
      local.get 0
      call $close
      drop
      i32.const 0
      local.set 2
    end
    local.get 2)
  (func $__fmodeflags (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 335544320
    i32.const 67108864
    i32.const 268435456
    local.get 0
    i32.load8_u
    local.tee 1
    i32.const 114
    i32.eq
    local.tee 2
    select
    local.get 0
    i32.const 43
    call $strchr
    select
    local.tee 3
    i32.const 16384
    i32.or
    local.get 3
    local.get 0
    i32.const 120
    call $strchr
    select
    local.tee 0
    local.get 0
    i32.const 4096
    i32.or
    local.get 2
    select
    local.tee 0
    i32.const 32768
    i32.or
    local.get 0
    local.get 1
    i32.const 119
    i32.eq
    select
    local.get 1
    i32.const 97
    i32.eq
    i32.or)
  (func $fcntl (type 2) (param i32 i32 i32) (result i32)
    (local i32 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const -1
                i32.add
                br_table 5 (;@1;) 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;)
              end
              i32.const 0
              local.set 1
              br 4 (;@1;)
            end
            block  ;; label = @5
              local.get 0
              local.get 3
              i32.const 8
              i32.add
              call $__wasi_fd_fdstat_get
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              i32.store offset=5696
              br 3 (;@2;)
            end
            local.get 3
            i64.load offset=16
            local.tee 4
            i64.const 64
            i64.and
            local.set 5
            local.get 3
            i32.load16_u offset=10
            local.set 1
            block  ;; label = @5
              local.get 4
              i64.const 16386
              i64.and
              i64.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 5
                i64.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.const 335544320
                i32.or
                local.set 1
                br 5 (;@1;)
              end
              local.get 1
              i32.const 67108864
              i32.or
              local.set 1
              br 4 (;@1;)
            end
            block  ;; label = @5
              local.get 5
              i64.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const 268435456
              i32.or
              local.set 1
              br 4 (;@1;)
            end
            local.get 1
            i32.const 134217728
            i32.or
            local.set 1
            br 3 (;@1;)
          end
          local.get 3
          local.get 2
          i32.const 4
          i32.add
          i32.store offset=8
          block  ;; label = @4
            local.get 0
            local.get 2
            i32.load
            i32.const 4095
            i32.and
            call $__wasi_fd_fdstat_set_flags
            local.tee 1
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            br 3 (;@1;)
          end
          i32.const 0
          local.get 1
          i32.store offset=5696
          br 1 (;@2;)
        end
        i32.const 0
        i32.const 28
        i32.store offset=5696
      end
      i32.const -1
      local.set 1
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__isatty (type 0) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        i32.const 8
        i32.add
        call $__wasi_fd_fdstat_get
        local.tee 0
        br_if 0 (;@2;)
        i32.const 59
        local.set 0
        local.get 1
        i32.load8_u offset=8
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u offset=16
        i32.const 36
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        br 1 (;@1;)
      end
      i32.const 0
      local.set 2
      i32.const 0
      local.get 0
      i32.store offset=5696
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $__fdopen (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 1171
        local.get 1
        i32.load8_s
        local.tee 3
        i32.const 4
        call $memchr
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        i32.const 0
        i32.const 28
        i32.store offset=5696
        br 1 (;@1;)
      end
      block  ;; label = @2
        i32.const 1144
        call $malloc
        local.tee 4
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      i32.const 0
      local.set 5
      local.get 4
      i32.const 0
      i32.const 112
      call $memset
      local.set 4
      block  ;; label = @2
        local.get 1
        i32.const 43
        call $strchr
        br_if 0 (;@2;)
        local.get 4
        i32.const 8
        i32.const 4
        local.get 3
        i32.const 114
        i32.eq
        select
        local.tee 5
        i32.store
      end
      block  ;; label = @2
        local.get 1
        i32.const 101
        call $strchr
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        i32.store offset=16
        local.get 0
        i32.const 2
        local.get 2
        i32.const 16
        i32.add
        call $fcntl
        drop
        local.get 1
        i32.load8_u
        local.set 3
      end
      block  ;; label = @2
        local.get 3
        i32.const 255
        i32.and
        i32.const 97
        i32.ne
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.const 0
          call $fcntl
          local.tee 1
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.const 1
          i32.or
          i32.store
          local.get 0
          i32.const 4
          local.get 2
          call $fcntl
          drop
        end
        local.get 4
        local.get 5
        i32.const 128
        i32.or
        local.tee 5
        i32.store
      end
      local.get 4
      i32.const -1
      i32.store offset=64
      local.get 4
      i32.const 1024
      i32.store offset=44
      local.get 4
      local.get 0
      i32.store offset=56
      local.get 4
      local.get 4
      i32.const 120
      i32.add
      i32.store offset=40
      block  ;; label = @2
        local.get 5
        i32.const 8
        i32.and
        br_if 0 (;@2;)
        local.get 0
        call $__isatty
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.const 10
        i32.store offset=64
      end
      local.get 4
      i32.const 3
      i32.store offset=36
      local.get 4
      i32.const 2
      i32.store offset=32
      local.get 4
      i32.const 4
      i32.store offset=28
      local.get 4
      i32.const 1
      i32.store offset=12
      local.get 4
      call $__ofl_add
      local.set 4
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $writev (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const -1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.const 28
        i32.store offset=5696
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 12
        i32.add
        call $__wasi_fd_write
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 2
        i32.store offset=5696
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=12
      local.set 4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $__stdio_write (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=24
    local.tee 1
    i32.store
    local.get 3
    local.get 0
    i32.load offset=20
    local.get 1
    i32.sub
    local.tee 1
    i32.store offset=4
    i32.const 2
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        i32.add
        local.tee 5
        local.get 0
        i32.load offset=56
        local.get 3
        i32.const 2
        call $writev
        local.tee 6
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            local.get 0
            i32.const 0
            i32.store offset=24
            local.get 0
            i64.const 0
            i64.store offset=16
            local.get 0
            local.get 0
            i32.load
            i32.const 32
            i32.or
            i32.store
            local.get 4
            i32.const 2
            i32.eq
            br_if 3 (;@1;)
            local.get 2
            local.get 1
            i32.load offset=4
            i32.sub
            local.set 6
            br 3 (;@1;)
          end
          local.get 1
          local.get 6
          local.get 1
          i32.load offset=4
          local.tee 7
          i32.gt_u
          local.tee 8
          i32.const 3
          i32.shl
          i32.add
          local.tee 9
          local.get 9
          i32.load
          local.get 6
          local.get 7
          i32.const 0
          local.get 8
          select
          i32.sub
          local.tee 7
          i32.add
          i32.store
          local.get 1
          i32.const 12
          i32.const 4
          local.get 8
          select
          i32.add
          local.tee 9
          local.get 9
          i32.load
          local.get 7
          i32.sub
          i32.store
          local.get 5
          local.get 6
          i32.sub
          local.tee 5
          local.get 0
          i32.load offset=56
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          local.get 8
          select
          local.tee 1
          local.get 4
          local.get 8
          i32.sub
          local.tee 4
          call $writev
          local.tee 6
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 0
      i32.load offset=40
      local.tee 1
      i32.store offset=24
      local.get 0
      local.get 1
      i32.store offset=20
      local.get 0
      local.get 1
      local.get 0
      i32.load offset=44
      i32.add
      i32.store offset=16
      local.get 2
      local.set 6
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 6)
  (func $dummy.1 (type 11) (param i32))
  (func $fclose (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    call $fflush
    local.set 1
    local.get 0
    local.get 0
    i32.load offset=12
    call_indirect (type 0)
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 0
      call $dummy.1
      call $__ofl_lock
      local.set 3
      block  ;; label = @2
        local.get 0
        i32.load offset=48
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 0
        i32.load offset=52
        i32.store offset=52
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=52
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 4
        i32.store offset=48
      end
      block  ;; label = @2
        local.get 3
        i32.load
        local.get 0
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 5
        i32.store
      end
      call $__ofl_unlock
      local.get 0
      i32.load offset=80
      call $free
      local.get 0
      call $free
    end
    local.get 2
    local.get 1
    i32.or)
  (func $__ofl_add (type 0) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    call $__ofl_lock
    local.tee 1
    i32.load
    i32.store offset=52
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i32.store offset=48
    end
    local.get 1
    local.get 0
    i32.store
    call $__ofl_unlock
    local.get 0)
  (func $ftell (type 0) (param i32) (result i32)
    (local i32 i32 i64)
    local.get 0
    i32.load offset=36
    local.set 1
    i32.const 1
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 128
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      i32.const 2
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=24
      i32.eq
      select
      local.set 2
    end
    block  ;; label = @1
      local.get 0
      i64.const 0
      local.get 2
      local.get 1
      call_indirect (type 1)
      local.tee 3
      i64.const 0
      i64.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            br 1 (;@3;)
          end
          local.get 0
          i32.load offset=24
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.const 20
          i32.add
          local.set 0
        end
        local.get 3
        local.get 0
        i32.load
        local.get 2
        i32.sub
        i64.extend_i32_s
        i64.add
        local.set 3
      end
      local.get 3
      i64.const 2147483648
      i64.lt_s
      br_if 0 (;@1;)
      i32.const 0
      i32.const 61
      i32.store offset=5696
      i32.const -1
      return
    end
    local.get 3
    i32.wrap_i64)
  (func $__stdio_close (type 0) (param i32) (result i32)
    local.get 0
    i32.load offset=56
    call $close)
  (func $__toread (type 0) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    local.get 0
    i32.load offset=60
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=60
    block  ;; label = @1
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=24
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 0
      local.get 0
      i32.load offset=32
      call_indirect (type 2)
      drop
    end
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i64.const 0
    i64.store offset=16
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 4
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    local.get 0
    i32.load offset=40
    local.get 0
    i32.load offset=44
    i32.add
    local.tee 2
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 27
    i32.shl
    i32.const 31
    i32.shr_s)
  (func $fread (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 3
    local.get 3
    i32.load offset=60
    local.tee 4
    i32.const -1
    i32.add
    local.get 4
    i32.or
    i32.store offset=60
    local.get 2
    local.get 1
    i32.mul
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=4
        local.tee 4
        local.get 3
        i32.load offset=8
        local.tee 6
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        local.set 4
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      local.get 6
      local.get 4
      i32.sub
      local.tee 6
      local.get 5
      local.get 6
      local.get 5
      i32.lt_u
      select
      local.tee 6
      call $memcpy
      local.set 0
      local.get 3
      local.get 4
      local.get 6
      i32.add
      i32.store offset=4
      local.get 5
      local.get 6
      i32.sub
      local.set 4
      local.get 0
      local.get 6
      i32.add
      local.set 0
    end
    local.get 2
    i32.const 0
    local.get 1
    select
    local.set 6
    block  ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            call $__toread
            br_if 0 (;@4;)
            local.get 3
            local.get 0
            local.get 4
            local.get 3
            i32.load offset=28
            call_indirect (type 2)
            local.tee 2
            br_if 1 (;@3;)
          end
          local.get 5
          local.get 4
          i32.sub
          local.get 1
          i32.div_u
          return
        end
        local.get 0
        local.get 2
        i32.add
        local.set 0
        local.get 4
        local.get 2
        i32.sub
        local.tee 4
        br_if 0 (;@2;)
      end
    end
    local.get 6)
  (func $fseek (type 2) (param i32 i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 28
      i32.store offset=5696
      i32.const -1
      return
    end
    local.get 1
    i64.extend_i32_s
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      local.get 0
      i32.load offset=4
      i32.sub
      i64.extend_i32_s
      i64.sub
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=24
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 0
      local.get 0
      i32.load offset=32
      call_indirect (type 2)
      drop
      local.get 0
      i32.load offset=20
      br_if 0 (;@1;)
      i32.const -1
      return
    end
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i64.const 0
    i64.store offset=16
    block  ;; label = @1
      local.get 0
      local.get 3
      local.get 2
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      i64.const 0
      i64.ge_s
      br_if 0 (;@1;)
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    local.get 0
    local.get 0
    i32.load
    i32.const -17
    i32.and
    i32.store
    i32.const 0)
  (func $fflush (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      block  ;; label = @2
        i32.const 0
        i32.load offset=5688
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=5688
        call $fflush
        local.set 1
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=5568
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=5568
        call $fflush
        local.get 1
        i32.or
        local.set 1
      end
      block  ;; label = @2
        call $__ofl_lock
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.get 0
            i32.load offset=24
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            i32.const 0
            i32.const 0
            local.get 0
            i32.load offset=32
            call_indirect (type 2)
            drop
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=20
                br_if 0 (;@6;)
                i32.const -1
                local.set 2
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 2
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                local.get 2
                local.get 3
                i32.sub
                i64.extend_i32_s
                i32.const 1
                local.get 0
                i32.load offset=36
                call_indirect (type 1)
                drop
              end
              i32.const 0
              local.set 2
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i64.const 0
              i64.store offset=4 align=4
            end
            local.get 2
            local.get 1
            i32.or
            local.set 1
          end
          local.get 0
          i32.load offset=52
          local.tee 0
          br_if 0 (;@3;)
        end
      end
      call $__ofl_unlock
      local.get 1
      return
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=24
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 0
      local.get 0
      i32.load offset=32
      call_indirect (type 2)
      drop
      local.get 0
      i32.load offset=20
      br_if 0 (;@1;)
      i32.const -1
      return
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i64.const 0
    i64.store offset=16
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    i32.const 0)
  (func $__stdio_exit (type 12)
    (local i32 i32 i32)
    block  ;; label = @1
      call $__ofl_lock
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=24
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=32
          call_indirect (type 2)
          drop
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 2
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          i32.sub
          i64.extend_i32_s
          i32.const 1
          local.get 0
          i32.load offset=36
          call_indirect (type 1)
          drop
        end
        local.get 0
        i32.load offset=52
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=6224
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=5688
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=5568
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end)
  (func $printf (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 5576
    local.get 0
    local.get 1
    call $vfprintf
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__ofl_lock (type 14) (result i32)
    i32.const 7272)
  (func $__ofl_unlock (type 12))
  (func $__lseek (type 1) (param i32 i64 i32) (result i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i32.const 255
        i32.and
        local.get 3
        i32.const 8
        i32.add
        call $__wasi_fd_seek
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 70
        local.get 0
        local.get 0
        i32.const 76
        i32.eq
        select
        i32.store offset=5696
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__stdio_seek (type 1) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=56
    local.get 1
    local.get 2
    call $__lseek)
  (func $fprintf (type 2) (param i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    call $vfprintf
    local.set 2
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $fileno (type 0) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=56
      local.tee 0
      i32.const -1
      i32.gt_s
      br_if 0 (;@1;)
      i32.const 0
      i32.const 8
      i32.store offset=5696
      i32.const -1
      local.set 0
    end
    local.get 0)
  (func $readv (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const -1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.const 28
        i32.store offset=5696
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 12
        i32.add
        call $__wasi_fd_read
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 2
        i32.store offset=5696
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=12
      local.set 4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $read (type 2) (param i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 3
        i32.const 8
        i32.add
        i32.const 1
        local.get 3
        i32.const 4
        i32.add
        call $__wasi_fd_read
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 8
        local.get 0
        local.get 0
        i32.const 76
        i32.eq
        select
        i32.store offset=5696
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=4
      local.set 0
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $__stdio_read (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store
    local.get 3
    local.get 0
    i32.load offset=44
    local.tee 4
    i32.store offset=12
    local.get 3
    local.get 0
    i32.load offset=40
    local.tee 5
    i32.store offset=8
    local.get 3
    local.get 2
    local.get 4
    i32.const 0
    i32.ne
    i32.sub
    local.tee 6
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=56
        local.get 3
        i32.const 2
        call $readv
        local.set 4
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=56
      local.get 5
      local.get 4
      call $read
      local.set 4
    end
    i32.const 0
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        i32.load
        i32.const 32
        i32.const 16
        local.get 4
        select
        i32.or
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        local.get 3
        i32.load offset=4
        local.tee 5
        i32.gt_u
        br_if 0 (;@2;)
        local.get 4
        local.set 6
        br 1 (;@1;)
      end
      local.get 0
      local.get 0
      i32.load offset=40
      local.tee 6
      i32.store offset=4
      local.get 0
      local.get 6
      local.get 4
      local.get 5
      i32.sub
      i32.add
      i32.store offset=8
      block  ;; label = @2
        local.get 0
        i32.load offset=44
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i32.const 1
        i32.add
        i32.store offset=4
        local.get 2
        local.get 1
        i32.add
        i32.const -1
        i32.add
        local.get 6
        i32.load8_u
        i32.store8
      end
      local.get 2
      local.set 6
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 6)
  (func $__towrite (type 0) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=60
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=60
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    local.get 0
    local.get 0
    i32.load offset=40
    local.tee 1
    i32.store offset=24
    local.get 0
    local.get 1
    i32.store offset=20
    local.get 0
    local.get 1
    local.get 0
    i32.load offset=44
    i32.add
    i32.store offset=16
    i32.const 0)
  (func $__fwritex (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=16
        local.set 3
      end
      block  ;; label = @2
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 5
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=32
        call_indirect (type 2)
        return
      end
      i32.const 0
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=64
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          local.get 1
          local.set 3
          br 1 (;@2;)
        end
        i32.const 0
        local.set 6
        local.get 0
        local.set 4
        i32.const 0
        local.set 3
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            local.set 3
            br 2 (;@2;)
          end
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 4
          local.get 1
          i32.add
          local.set 7
          local.get 4
          i32.const -1
          i32.add
          local.tee 8
          local.set 4
          local.get 7
          i32.const -1
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        i32.sub
        i32.const 1
        i32.add
        local.tee 6
        local.get 2
        i32.load offset=32
        call_indirect (type 2)
        local.tee 4
        local.get 6
        i32.lt_u
        br_if 1 (;@1;)
        local.get 3
        i32.const -1
        i32.add
        local.set 3
        local.get 8
        local.get 1
        i32.add
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.load offset=20
        local.set 5
      end
      local.get 5
      local.get 0
      local.get 3
      call $memcpy
      drop
      local.get 2
      local.get 2
      i32.load offset=20
      local.get 3
      i32.add
      i32.store offset=20
      local.get 6
      local.get 3
      i32.add
      local.set 4
    end
    local.get 4)
  (func $fwrite (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 2
    local.get 1
    i32.mul
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=16
        local.tee 5
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        local.get 3
        call $__towrite
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=16
        local.set 5
      end
      block  ;; label = @2
        local.get 5
        local.get 3
        i32.load offset=20
        local.tee 6
        i32.sub
        local.get 4
        i32.ge_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 4
        local.get 3
        i32.load offset=32
        call_indirect (type 2)
        local.set 5
        br 1 (;@1;)
      end
      i32.const 0
      local.set 7
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load offset=64
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          local.get 4
          local.set 5
          br 1 (;@2;)
        end
        local.get 0
        local.get 4
        i32.add
        local.set 8
        i32.const 0
        local.set 7
        i32.const 0
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 5
            i32.add
            br_if 0 (;@4;)
            local.get 4
            local.set 5
            br 2 (;@2;)
          end
          local.get 8
          local.get 5
          i32.add
          local.set 9
          local.get 5
          i32.const -1
          i32.add
          local.tee 10
          local.set 5
          local.get 9
          i32.const -1
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 0
        local.get 4
        local.get 10
        i32.add
        i32.const 1
        i32.add
        local.tee 7
        local.get 3
        i32.load offset=32
        call_indirect (type 2)
        local.tee 5
        local.get 7
        i32.lt_u
        br_if 1 (;@1;)
        local.get 10
        i32.const -1
        i32.xor
        local.set 5
        local.get 8
        local.get 10
        i32.add
        i32.const 1
        i32.add
        local.set 0
        local.get 3
        i32.load offset=20
        local.set 6
      end
      local.get 6
      local.get 0
      local.get 5
      call $memcpy
      drop
      local.get 3
      local.get 3
      i32.load offset=20
      local.get 5
      i32.add
      i32.store offset=20
      local.get 7
      local.get 5
      i32.add
      local.set 5
    end
    block  ;; label = @1
      local.get 5
      local.get 4
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 5
    local.get 1
    i32.div_u)
  (func $strerror (type 0) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=7300
      local.tee 1
      br_if 0 (;@1;)
      i32.const 7276
      local.set 1
      i32.const 0
      i32.const 7276
      i32.store offset=7300
    end
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i32.const 1
    i32.shl
    i32.const 4816
    i32.add
    i32.load16_u
    i32.const 3264
    i32.add
    local.get 1
    i32.load offset=20
    call $__lctrans)
  (func $fputs (type 3) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    call $strlen
    local.set 2
    i32.const -1
    i32.const 0
    local.get 2
    local.get 0
    i32.const 1
    local.get 2
    local.get 1
    call $fwrite
    i32.ne
    select)
  (func $vfprintf (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 208
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=204
    local.get 3
    i32.const 160
    i32.add
    i32.const 32
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 184
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 176
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=168
    local.get 3
    i64.const 0
    i64.store offset=160
    local.get 3
    local.get 2
    i32.store offset=200
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      local.set 4
      block  ;; label = @2
        local.get 0
        i32.load offset=60
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.const -33
        i32.and
        i32.store
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=44
              br_if 0 (;@5;)
              local.get 0
              i32.const 80
              i32.store offset=44
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i32.load offset=40
              local.set 5
              local.get 0
              local.get 3
              i32.store offset=40
              br 1 (;@4;)
            end
            i32.const 0
            local.set 5
            local.get 0
            i32.load offset=16
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 2
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        local.set 2
      end
      local.get 4
      i32.const 32
      i32.and
      local.set 1
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
        local.get 0
        i32.const 0
        i32.store offset=44
        local.get 0
        local.get 5
        i32.store offset=40
        local.get 0
        i32.const 0
        i32.store offset=24
        local.get 0
        i32.load offset=20
        local.set 5
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 2
        i32.const -1
        local.get 5
        select
        local.set 2
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 5
      local.get 1
      i32.or
      i32.store
      i32.const -1
      local.get 2
      local.get 5
      i32.const 32
      i32.and
      select
      local.set 0
    end
    local.get 3
    i32.const 208
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $printf_core (type 9) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 f64 i32 i32 i32 i32 i32 i32 f64)
    global.get $__stack_pointer
    i32.const 880
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 68
    i32.add
    i32.const 12
    i32.add
    local.set 6
    local.get 5
    i32.const 55
    i32.add
    local.set 7
    i32.const -2
    local.get 5
    i32.const 80
    i32.add
    i32.sub
    local.set 8
    local.get 5
    i32.const 68
    i32.add
    i32.const 11
    i32.add
    local.set 9
    local.get 5
    i32.const 80
    i32.add
    i32.const 8
    i32.or
    local.set 10
    local.get 5
    i32.const 80
    i32.add
    i32.const 9
    i32.or
    local.set 11
    i32.const -10
    local.get 5
    i32.const 68
    i32.add
    i32.sub
    local.set 12
    local.get 5
    i32.const 68
    i32.add
    i32.const 10
    i32.add
    local.set 13
    local.get 5
    i32.const 404
    i32.add
    local.set 14
    local.get 5
    i32.const 112
    i32.add
    i32.const 4
    i32.or
    local.set 15
    local.get 5
    i32.const 400
    i32.add
    local.set 16
    local.get 5
    i32.const 56
    i32.add
    local.set 17
    i32.const 0
    local.set 18
    i32.const 0
    local.set 19
    i32.const 0
    local.set 20
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            local.set 21
            local.get 20
            i32.const 2147483647
            local.get 19
            i32.sub
            i32.gt_s
            br_if 1 (;@3;)
            local.get 20
            local.get 19
            i32.add
            local.set 19
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 21
                      i32.load8_u
                      local.tee 20
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 21
                      local.set 1
                      loop  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 20
                              i32.const 255
                              i32.and
                              local.tee 20
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 20
                              i32.const 37
                              i32.ne
                              br_if 2 (;@11;)
                              local.get 1
                              local.set 20
                              loop  ;; label = @14
                                local.get 1
                                i32.const 1
                                i32.add
                                i32.load8_u
                                i32.const 37
                                i32.ne
                                br_if 2 (;@12;)
                                local.get 20
                                i32.const 1
                                i32.add
                                local.set 20
                                local.get 1
                                i32.const 2
                                i32.add
                                local.tee 1
                                i32.load8_u
                                i32.const 37
                                i32.eq
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 1
                            local.set 20
                          end
                          local.get 20
                          local.get 21
                          i32.sub
                          local.tee 20
                          i32.const 2147483647
                          local.get 19
                          i32.sub
                          local.tee 22
                          i32.gt_s
                          br_if 8 (;@3;)
                          block  ;; label = @12
                            local.get 0
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 21
                            local.get 20
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 20
                          br_if 7 (;@4;)
                          local.get 1
                          i32.const 1
                          i32.add
                          local.set 20
                          i32.const -1
                          local.set 23
                          block  ;; label = @12
                            local.get 1
                            i32.load8_s offset=1
                            local.tee 24
                            i32.const -48
                            i32.add
                            local.tee 25
                            i32.const 9
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 1
                            i32.load8_u offset=2
                            i32.const 36
                            i32.ne
                            br_if 0 (;@12;)
                            local.get 1
                            i32.const 3
                            i32.add
                            local.set 20
                            local.get 1
                            i32.load8_s offset=3
                            local.set 24
                            i32.const 1
                            local.set 18
                            local.get 25
                            local.set 23
                          end
                          i32.const 0
                          local.set 26
                          block  ;; label = @12
                            local.get 24
                            i32.const -32
                            i32.add
                            local.tee 1
                            i32.const 31
                            i32.gt_u
                            br_if 0 (;@12;)
                            i32.const 1
                            local.get 1
                            i32.shl
                            local.tee 1
                            i32.const 75913
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 20
                            i32.const 1
                            i32.add
                            local.set 25
                            i32.const 0
                            local.set 26
                            loop  ;; label = @13
                              local.get 1
                              local.get 26
                              i32.or
                              local.set 26
                              local.get 25
                              local.tee 20
                              i32.load8_s
                              local.tee 24
                              i32.const -32
                              i32.add
                              local.tee 1
                              i32.const 32
                              i32.ge_u
                              br_if 1 (;@12;)
                              local.get 20
                              i32.const 1
                              i32.add
                              local.set 25
                              i32.const 1
                              local.get 1
                              i32.shl
                              local.tee 1
                              i32.const 75913
                              i32.and
                              br_if 0 (;@13;)
                            end
                          end
                          block  ;; label = @12
                            local.get 24
                            i32.const 42
                            i32.ne
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 20
                                i32.load8_s offset=1
                                i32.const -48
                                i32.add
                                local.tee 1
                                i32.const 9
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 20
                                i32.load8_u offset=2
                                i32.const 36
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 4
                                local.get 1
                                i32.const 2
                                i32.shl
                                i32.add
                                i32.const 10
                                i32.store
                                local.get 20
                                i32.const 3
                                i32.add
                                local.set 25
                                local.get 20
                                i32.load8_s offset=1
                                i32.const 3
                                i32.shl
                                local.get 3
                                i32.add
                                i32.const -384
                                i32.add
                                i32.load
                                local.set 27
                                i32.const 1
                                local.set 18
                                br 1 (;@13;)
                              end
                              local.get 18
                              br_if 6 (;@7;)
                              local.get 20
                              i32.const 1
                              i32.add
                              local.set 25
                              block  ;; label = @14
                                local.get 0
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 18
                                i32.const 0
                                local.set 27
                                br 6 (;@8;)
                              end
                              local.get 2
                              local.get 2
                              i32.load
                              local.tee 1
                              i32.const 4
                              i32.add
                              i32.store
                              local.get 1
                              i32.load
                              local.set 27
                              i32.const 0
                              local.set 18
                            end
                            local.get 27
                            i32.const -1
                            i32.gt_s
                            br_if 4 (;@8;)
                            i32.const 0
                            local.get 27
                            i32.sub
                            local.set 27
                            local.get 26
                            i32.const 8192
                            i32.or
                            local.set 26
                            br 4 (;@8;)
                          end
                          i32.const 0
                          local.set 27
                          block  ;; label = @12
                            local.get 24
                            i32.const -48
                            i32.add
                            local.tee 1
                            i32.const 9
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 20
                            local.set 25
                            br 4 (;@8;)
                          end
                          i32.const 0
                          local.set 27
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 27
                              i32.const 214748364
                              i32.gt_u
                              br_if 0 (;@13;)
                              i32.const -1
                              local.get 27
                              i32.const 10
                              i32.mul
                              local.tee 25
                              local.get 1
                              i32.add
                              local.get 1
                              i32.const 2147483647
                              local.get 25
                              i32.sub
                              i32.gt_u
                              select
                              local.set 27
                              local.get 20
                              i32.load8_s offset=1
                              local.set 1
                              local.get 20
                              i32.const 1
                              i32.add
                              local.tee 25
                              local.set 20
                              local.get 1
                              i32.const -48
                              i32.add
                              local.tee 1
                              i32.const 10
                              i32.lt_u
                              br_if 1 (;@12;)
                              local.get 27
                              i32.const 0
                              i32.lt_s
                              br_if 10 (;@3;)
                              br 5 (;@8;)
                            end
                            local.get 20
                            i32.load8_s offset=1
                            local.set 1
                            i32.const -1
                            local.set 27
                            local.get 20
                            i32.const 1
                            i32.add
                            local.set 20
                            local.get 1
                            i32.const -48
                            i32.add
                            local.tee 1
                            i32.const 10
                            i32.lt_u
                            br_if 0 (;@12;)
                            br 9 (;@3;)
                          end
                        end
                        local.get 1
                        i32.const 1
                        i32.add
                        local.tee 1
                        i32.load8_u
                        local.set 20
                        br 0 (;@10;)
                      end
                    end
                    local.get 0
                    br_if 7 (;@1;)
                    block  ;; label = @9
                      local.get 18
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 19
                      br 8 (;@1;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=4
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 1
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 8
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=8
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 2
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 16
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=12
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 3
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 24
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=16
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 4
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 32
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=20
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 5
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 40
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=24
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 6
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 48
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=28
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 7
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 56
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=32
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 8
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 64
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=36
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 9
                        local.set 1
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 72
                      i32.add
                      local.get 1
                      local.get 2
                      call $pop_arg
                      i32.const 1
                      local.set 19
                      br 8 (;@1;)
                    end
                    local.get 1
                    i32.const 2
                    i32.shl
                    local.set 1
                    loop  ;; label = @9
                      local.get 4
                      local.get 1
                      i32.add
                      i32.load
                      br_if 2 (;@7;)
                      local.get 1
                      i32.const 4
                      i32.add
                      local.tee 1
                      i32.const 40
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    i32.const 1
                    local.set 19
                    br 7 (;@1;)
                  end
                  i32.const 0
                  local.set 20
                  i32.const -1
                  local.set 24
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 25
                      i32.load8_u
                      i32.const 46
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 25
                      local.set 1
                      i32.const 0
                      local.set 28
                      br 1 (;@8;)
                    end
                    block  ;; label = @9
                      local.get 25
                      i32.load8_s offset=1
                      local.tee 24
                      i32.const 42
                      i32.ne
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 25
                          i32.load8_s offset=2
                          i32.const -48
                          i32.add
                          local.tee 1
                          i32.const 9
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 25
                          i32.load8_u offset=3
                          i32.const 36
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 1
                          i32.const 2
                          i32.shl
                          i32.add
                          i32.const 10
                          i32.store
                          local.get 25
                          i32.const 4
                          i32.add
                          local.set 1
                          local.get 25
                          i32.load8_s offset=2
                          i32.const 3
                          i32.shl
                          local.get 3
                          i32.add
                          i32.const -384
                          i32.add
                          i32.load
                          local.set 24
                          br 1 (;@10;)
                        end
                        local.get 18
                        br_if 3 (;@7;)
                        local.get 25
                        i32.const 2
                        i32.add
                        local.set 1
                        block  ;; label = @11
                          local.get 0
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 24
                          br 1 (;@10;)
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 25
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 25
                        i32.load
                        local.set 24
                      end
                      local.get 24
                      i32.const -1
                      i32.xor
                      i32.const 31
                      i32.shr_u
                      local.set 28
                      br 1 (;@8;)
                    end
                    local.get 25
                    i32.const 1
                    i32.add
                    local.set 1
                    block  ;; label = @9
                      local.get 24
                      i32.const -48
                      i32.add
                      local.tee 29
                      i32.const 9
                      i32.le_u
                      br_if 0 (;@9;)
                      i32.const 1
                      local.set 28
                      i32.const 0
                      local.set 24
                      br 1 (;@8;)
                    end
                    i32.const 0
                    local.set 25
                    loop  ;; label = @9
                      i32.const -1
                      local.set 24
                      block  ;; label = @10
                        local.get 25
                        i32.const 214748364
                        i32.gt_u
                        br_if 0 (;@10;)
                        i32.const -1
                        local.get 25
                        i32.const 10
                        i32.mul
                        local.tee 25
                        local.get 29
                        i32.add
                        local.get 29
                        i32.const 2147483647
                        local.get 25
                        i32.sub
                        i32.gt_u
                        select
                        local.set 24
                      end
                      i32.const 1
                      local.set 28
                      local.get 24
                      local.set 25
                      local.get 1
                      i32.const 1
                      i32.add
                      local.tee 1
                      i32.load8_s
                      i32.const -48
                      i32.add
                      local.tee 29
                      i32.const 10
                      i32.lt_u
                      br_if 0 (;@9;)
                    end
                  end
                  loop  ;; label = @8
                    local.get 20
                    local.set 25
                    local.get 1
                    i32.load8_s
                    local.tee 20
                    i32.const -123
                    i32.add
                    i32.const -58
                    i32.lt_u
                    br_if 1 (;@7;)
                    local.get 1
                    i32.const 1
                    i32.add
                    local.set 1
                    local.get 20
                    local.get 25
                    i32.const 58
                    i32.mul
                    i32.add
                    i32.const 4911
                    i32.add
                    i32.load8_u
                    local.tee 20
                    i32.const -1
                    i32.add
                    i32.const 8
                    i32.lt_u
                    br_if 0 (;@8;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 20
                        i32.const 27
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 20
                        i32.eqz
                        br_if 3 (;@7;)
                        block  ;; label = @11
                          local.get 23
                          i32.const 0
                          i32.lt_s
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 23
                          i32.const 2
                          i32.shl
                          i32.add
                          local.get 20
                          i32.store
                          local.get 5
                          local.get 3
                          local.get 23
                          i32.const 3
                          i32.shl
                          i32.add
                          i64.load
                          i64.store offset=56
                          br 2 (;@9;)
                        end
                        block  ;; label = @11
                          local.get 0
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 19
                          br 10 (;@1;)
                        end
                        local.get 5
                        i32.const 56
                        i32.add
                        local.get 20
                        local.get 2
                        call $pop_arg
                        br 2 (;@8;)
                      end
                      local.get 23
                      i32.const -1
                      i32.gt_s
                      br_if 2 (;@7;)
                    end
                    i32.const 0
                    local.set 20
                    local.get 0
                    i32.eqz
                    br_if 4 (;@4;)
                  end
                  local.get 26
                  i32.const -65537
                  i32.and
                  local.tee 29
                  local.get 26
                  local.get 26
                  i32.const 8192
                  i32.and
                  select
                  local.set 30
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        local.get 1
                                                        i32.const -1
                                                        i32.add
                                                        i32.load8_s
                                                        local.tee 20
                                                        i32.const -33
                                                        i32.and
                                                        local.get 20
                                                        local.get 20
                                                        i32.const 15
                                                        i32.and
                                                        i32.const 3
                                                        i32.eq
                                                        select
                                                        local.get 20
                                                        local.get 25
                                                        select
                                                        local.tee 31
                                                        i32.const -65
                                                        i32.add
                                                        br_table 16 (;@10;) 17 (;@9;) 13 (;@13;) 17 (;@9;) 16 (;@10;) 16 (;@10;) 16 (;@10;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 12 (;@14;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 3 (;@23;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 16 (;@10;) 17 (;@9;) 8 (;@18;) 5 (;@21;) 16 (;@10;) 16 (;@10;) 16 (;@10;) 17 (;@9;) 5 (;@21;) 17 (;@9;) 17 (;@9;) 17 (;@9;) 9 (;@17;) 1 (;@25;) 4 (;@22;) 2 (;@24;) 17 (;@9;) 17 (;@9;) 10 (;@16;) 17 (;@9;) 0 (;@26;) 17 (;@9;) 17 (;@9;) 3 (;@23;) 17 (;@9;)
                                                      end
                                                      i32.const 0
                                                      local.set 23
                                                      i32.const 1024
                                                      local.set 32
                                                      local.get 5
                                                      i64.load offset=56
                                                      local.set 33
                                                      br 5 (;@20;)
                                                    end
                                                    i32.const 0
                                                    local.set 20
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  local.get 25
                                                                  i32.const 255
                                                                  i32.and
                                                                  br_table 0 (;@31;) 1 (;@30;) 2 (;@29;) 3 (;@28;) 4 (;@27;) 27 (;@4;) 5 (;@26;) 6 (;@25;) 27 (;@4;)
                                                                end
                                                                local.get 5
                                                                i32.load offset=56
                                                                local.get 19
                                                                i32.store
                                                                br 26 (;@4;)
                                                              end
                                                              local.get 5
                                                              i32.load offset=56
                                                              local.get 19
                                                              i32.store
                                                              br 25 (;@4;)
                                                            end
                                                            local.get 5
                                                            i32.load offset=56
                                                            local.get 19
                                                            i64.extend_i32_s
                                                            i64.store
                                                            br 24 (;@4;)
                                                          end
                                                          local.get 5
                                                          i32.load offset=56
                                                          local.get 19
                                                          i32.store16
                                                          br 23 (;@4;)
                                                        end
                                                        local.get 5
                                                        i32.load offset=56
                                                        local.get 19
                                                        i32.store8
                                                        br 22 (;@4;)
                                                      end
                                                      local.get 5
                                                      i32.load offset=56
                                                      local.get 19
                                                      i32.store
                                                      br 21 (;@4;)
                                                    end
                                                    local.get 5
                                                    i32.load offset=56
                                                    local.get 19
                                                    i64.extend_i32_s
                                                    i64.store
                                                    br 20 (;@4;)
                                                  end
                                                  local.get 24
                                                  i32.const 8
                                                  local.get 24
                                                  i32.const 8
                                                  i32.gt_u
                                                  select
                                                  local.set 24
                                                  local.get 30
                                                  i32.const 8
                                                  i32.or
                                                  local.set 30
                                                  i32.const 120
                                                  local.set 31
                                                end
                                                i32.const 0
                                                local.set 23
                                                i32.const 1024
                                                local.set 32
                                                block  ;; label = @23
                                                  local.get 5
                                                  i64.load offset=56
                                                  local.tee 33
                                                  i64.eqz
                                                  i32.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 17
                                                  local.set 21
                                                  br 4 (;@19;)
                                                end
                                                local.get 31
                                                i32.const 32
                                                i32.and
                                                local.set 25
                                                local.get 17
                                                local.set 21
                                                loop  ;; label = @23
                                                  local.get 21
                                                  i32.const -1
                                                  i32.add
                                                  local.tee 21
                                                  local.get 33
                                                  i32.wrap_i64
                                                  i32.const 15
                                                  i32.and
                                                  i32.const 5440
                                                  i32.add
                                                  i32.load8_u
                                                  local.get 25
                                                  i32.or
                                                  i32.store8
                                                  local.get 33
                                                  i64.const 15
                                                  i64.gt_u
                                                  local.set 20
                                                  local.get 33
                                                  i64.const 4
                                                  i64.shr_u
                                                  local.set 33
                                                  local.get 20
                                                  br_if 0 (;@23;)
                                                end
                                                local.get 30
                                                i32.const 8
                                                i32.and
                                                i32.eqz
                                                br_if 3 (;@19;)
                                                local.get 31
                                                i32.const 4
                                                i32.shr_s
                                                i32.const 1024
                                                i32.add
                                                local.set 32
                                                i32.const 2
                                                local.set 23
                                                br 3 (;@19;)
                                              end
                                              local.get 17
                                              local.set 21
                                              block  ;; label = @22
                                                local.get 5
                                                i64.load offset=56
                                                local.tee 33
                                                i64.eqz
                                                br_if 0 (;@22;)
                                                local.get 17
                                                local.set 21
                                                loop  ;; label = @23
                                                  local.get 21
                                                  i32.const -1
                                                  i32.add
                                                  local.tee 21
                                                  local.get 33
                                                  i32.wrap_i64
                                                  i32.const 7
                                                  i32.and
                                                  i32.const 48
                                                  i32.or
                                                  i32.store8
                                                  local.get 33
                                                  i64.const 7
                                                  i64.gt_u
                                                  local.set 20
                                                  local.get 33
                                                  i64.const 3
                                                  i64.shr_u
                                                  local.set 33
                                                  local.get 20
                                                  br_if 0 (;@23;)
                                                end
                                              end
                                              i32.const 0
                                              local.set 23
                                              i32.const 1024
                                              local.set 32
                                              local.get 30
                                              i32.const 8
                                              i32.and
                                              i32.eqz
                                              br_if 2 (;@19;)
                                              local.get 24
                                              local.get 17
                                              local.get 21
                                              i32.sub
                                              local.tee 20
                                              i32.const 1
                                              i32.add
                                              local.get 24
                                              local.get 20
                                              i32.gt_s
                                              select
                                              local.set 24
                                              br 2 (;@19;)
                                            end
                                            block  ;; label = @21
                                              local.get 5
                                              i64.load offset=56
                                              local.tee 33
                                              i64.const -1
                                              i64.gt_s
                                              br_if 0 (;@21;)
                                              local.get 5
                                              i64.const 0
                                              local.get 33
                                              i64.sub
                                              local.tee 33
                                              i64.store offset=56
                                              i32.const 1
                                              local.set 23
                                              i32.const 1024
                                              local.set 32
                                              br 1 (;@20;)
                                            end
                                            block  ;; label = @21
                                              local.get 30
                                              i32.const 2048
                                              i32.and
                                              i32.eqz
                                              br_if 0 (;@21;)
                                              i32.const 1
                                              local.set 23
                                              i32.const 1025
                                              local.set 32
                                              br 1 (;@20;)
                                            end
                                            i32.const 1026
                                            i32.const 1024
                                            local.get 30
                                            i32.const 1
                                            i32.and
                                            local.tee 23
                                            select
                                            local.set 32
                                          end
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              local.get 33
                                              i64.const 4294967296
                                              i64.ge_u
                                              br_if 0 (;@21;)
                                              local.get 33
                                              local.set 34
                                              local.get 17
                                              local.set 21
                                              br 1 (;@20;)
                                            end
                                            local.get 17
                                            local.set 21
                                            loop  ;; label = @21
                                              local.get 21
                                              i32.const -1
                                              i32.add
                                              local.tee 21
                                              local.get 33
                                              local.get 33
                                              i64.const 10
                                              i64.div_u
                                              local.tee 34
                                              i64.const 10
                                              i64.mul
                                              i64.sub
                                              i32.wrap_i64
                                              i32.const 48
                                              i32.or
                                              i32.store8
                                              local.get 33
                                              i64.const 42949672959
                                              i64.gt_u
                                              local.set 20
                                              local.get 34
                                              local.set 33
                                              local.get 20
                                              br_if 0 (;@21;)
                                            end
                                          end
                                          local.get 34
                                          i32.wrap_i64
                                          local.tee 20
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          loop  ;; label = @20
                                            local.get 21
                                            i32.const -1
                                            i32.add
                                            local.tee 21
                                            local.get 20
                                            local.get 20
                                            i32.const 10
                                            i32.div_u
                                            local.tee 25
                                            i32.const 10
                                            i32.mul
                                            i32.sub
                                            i32.const 48
                                            i32.or
                                            i32.store8
                                            local.get 20
                                            i32.const 9
                                            i32.gt_u
                                            local.set 26
                                            local.get 25
                                            local.set 20
                                            local.get 26
                                            br_if 0 (;@20;)
                                          end
                                        end
                                        block  ;; label = @19
                                          local.get 28
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 24
                                          i32.const 0
                                          i32.lt_s
                                          br_if 16 (;@3;)
                                        end
                                        local.get 30
                                        i32.const -65537
                                        i32.and
                                        local.get 30
                                        local.get 28
                                        select
                                        local.set 29
                                        block  ;; label = @19
                                          local.get 5
                                          i64.load offset=56
                                          local.tee 33
                                          i64.const 0
                                          i64.ne
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          local.set 26
                                          local.get 24
                                          br_if 0 (;@19;)
                                          local.get 17
                                          local.set 21
                                          local.get 17
                                          local.set 20
                                          br 11 (;@8;)
                                        end
                                        local.get 24
                                        local.get 17
                                        local.get 21
                                        i32.sub
                                        local.get 33
                                        i64.eqz
                                        i32.add
                                        local.tee 20
                                        local.get 24
                                        local.get 20
                                        i32.gt_s
                                        select
                                        local.set 26
                                        local.get 17
                                        local.set 20
                                        br 10 (;@8;)
                                      end
                                      local.get 5
                                      local.get 5
                                      i64.load offset=56
                                      i64.store8 offset=55
                                      i32.const 0
                                      local.set 23
                                      i32.const 1024
                                      local.set 32
                                      i32.const 1
                                      local.set 26
                                      local.get 7
                                      local.set 21
                                      local.get 17
                                      local.set 20
                                      br 9 (;@8;)
                                    end
                                    i32.const 0
                                    i32.load offset=5696
                                    call $strerror
                                    local.set 21
                                    br 1 (;@15;)
                                  end
                                  local.get 5
                                  i32.load offset=56
                                  local.tee 20
                                  i32.const 1578
                                  local.get 20
                                  select
                                  local.set 21
                                end
                                i32.const 0
                                local.set 23
                                local.get 21
                                local.get 21
                                i32.const 2147483647
                                local.get 24
                                local.get 24
                                i32.const 0
                                i32.lt_s
                                select
                                call $strnlen
                                local.tee 26
                                i32.add
                                local.set 20
                                i32.const 1024
                                local.set 32
                                local.get 24
                                i32.const -1
                                i32.gt_s
                                br_if 6 (;@8;)
                                local.get 20
                                i32.load8_u
                                i32.eqz
                                br_if 6 (;@8;)
                                br 11 (;@3;)
                              end
                              local.get 5
                              i32.load offset=56
                              local.set 25
                              local.get 24
                              br_if 1 (;@12;)
                              i32.const 0
                              local.set 20
                              br 2 (;@11;)
                            end
                            local.get 5
                            i32.const 0
                            i32.store offset=12
                            local.get 5
                            local.get 5
                            i64.load offset=56
                            i64.store32 offset=8
                            local.get 5
                            local.get 5
                            i32.const 8
                            i32.add
                            i32.store offset=56
                            i32.const -1
                            local.set 24
                            local.get 5
                            i32.const 8
                            i32.add
                            local.set 25
                          end
                          i32.const 0
                          local.set 20
                          local.get 25
                          local.set 21
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 21
                              i32.load
                              local.tee 22
                              i32.eqz
                              br_if 1 (;@12;)
                              block  ;; label = @14
                                local.get 5
                                i32.const 4
                                i32.add
                                local.get 22
                                call $wctomb
                                local.tee 22
                                i32.const 0
                                i32.lt_s
                                local.tee 26
                                br_if 0 (;@14;)
                                local.get 22
                                local.get 24
                                local.get 20
                                i32.sub
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 21
                                i32.const 4
                                i32.add
                                local.set 21
                                local.get 24
                                local.get 22
                                local.get 20
                                i32.add
                                local.tee 20
                                i32.gt_u
                                br_if 1 (;@13;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 26
                            br_if 10 (;@2;)
                          end
                          local.get 20
                          i32.const 0
                          i32.lt_s
                          br_if 8 (;@3;)
                        end
                        block  ;; label = @11
                          local.get 30
                          i32.const 73728
                          i32.and
                          local.tee 26
                          br_if 0 (;@11;)
                          local.get 27
                          local.get 20
                          i32.le_s
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          i32.const 32
                          local.get 27
                          local.get 20
                          i32.sub
                          local.tee 21
                          i32.const 256
                          local.get 21
                          i32.const 256
                          i32.lt_u
                          local.tee 22
                          select
                          call $memset
                          drop
                          block  ;; label = @12
                            local.get 22
                            br_if 0 (;@12;)
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 112
                                i32.add
                                i32.const 256
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 21
                              i32.const -256
                              i32.add
                              local.tee 21
                              i32.const 255
                              i32.gt_u
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          local.get 21
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        block  ;; label = @11
                          local.get 20
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 21
                          loop  ;; label = @12
                            local.get 25
                            i32.load
                            local.tee 22
                            i32.eqz
                            br_if 1 (;@11;)
                            local.get 5
                            i32.const 4
                            i32.add
                            local.get 22
                            call $wctomb
                            local.tee 22
                            local.get 21
                            i32.add
                            local.tee 21
                            local.get 20
                            i32.gt_u
                            br_if 1 (;@11;)
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 4
                              i32.add
                              local.get 22
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 25
                            i32.const 4
                            i32.add
                            local.set 25
                            local.get 21
                            local.get 20
                            i32.lt_u
                            br_if 0 (;@12;)
                          end
                        end
                        block  ;; label = @11
                          local.get 26
                          i32.const 8192
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 27
                          local.get 20
                          i32.le_s
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          i32.const 32
                          local.get 27
                          local.get 20
                          i32.sub
                          local.tee 21
                          i32.const 256
                          local.get 21
                          i32.const 256
                          i32.lt_u
                          local.tee 22
                          select
                          call $memset
                          drop
                          block  ;; label = @12
                            local.get 22
                            br_if 0 (;@12;)
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 112
                                i32.add
                                i32.const 256
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 21
                              i32.const -256
                              i32.add
                              local.tee 21
                              i32.const 255
                              i32.gt_u
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          local.get 21
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 27
                        local.get 20
                        local.get 27
                        local.get 20
                        i32.gt_s
                        select
                        local.set 20
                        br 6 (;@4;)
                      end
                      block  ;; label = @10
                        local.get 28
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 24
                        i32.const 0
                        i32.lt_s
                        br_if 7 (;@3;)
                      end
                      local.get 5
                      f64.load offset=56
                      local.set 35
                      local.get 5
                      i32.const 0
                      i32.store offset=108
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 35
                          i64.reinterpret_f64
                          i64.const -1
                          i64.gt_s
                          br_if 0 (;@11;)
                          local.get 35
                          f64.neg
                          local.set 35
                          i32.const 1
                          local.set 36
                          i32.const 0
                          local.set 37
                          i32.const 1034
                          local.set 38
                          br 1 (;@10;)
                        end
                        block  ;; label = @11
                          local.get 30
                          i32.const 2048
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1
                          local.set 36
                          i32.const 0
                          local.set 37
                          i32.const 1037
                          local.set 38
                          br 1 (;@10;)
                        end
                        i32.const 1040
                        i32.const 1035
                        local.get 30
                        i32.const 1
                        i32.and
                        local.tee 36
                        select
                        local.set 38
                        local.get 36
                        i32.eqz
                        local.set 37
                      end
                      block  ;; label = @10
                        local.get 35
                        f64.abs
                        f64.const inf (;=inf;)
                        f64.lt
                        br_if 0 (;@10;)
                        local.get 36
                        i32.const 3
                        i32.add
                        local.set 21
                        block  ;; label = @11
                          local.get 30
                          i32.const 8192
                          i32.and
                          br_if 0 (;@11;)
                          local.get 27
                          local.get 21
                          i32.le_s
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          i32.const 32
                          local.get 27
                          local.get 21
                          i32.sub
                          local.tee 20
                          i32.const 256
                          local.get 20
                          i32.const 256
                          i32.lt_u
                          local.tee 22
                          select
                          call $memset
                          drop
                          block  ;; label = @12
                            local.get 22
                            br_if 0 (;@12;)
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 624
                                i32.add
                                i32.const 256
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 20
                              i32.const -256
                              i32.add
                              local.tee 20
                              i32.const 255
                              i32.gt_u
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          local.get 20
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        block  ;; label = @11
                          local.get 0
                          i32.load
                          local.tee 20
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 38
                          local.get 36
                          local.get 0
                          call $__fwritex
                          drop
                          local.get 0
                          i32.load
                          local.set 20
                        end
                        block  ;; label = @11
                          local.get 20
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 1118
                          i32.const 1202
                          local.get 31
                          i32.const 32
                          i32.and
                          local.tee 20
                          select
                          i32.const 1122
                          i32.const 1219
                          local.get 20
                          select
                          local.get 35
                          local.get 35
                          f64.ne
                          select
                          i32.const 3
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        block  ;; label = @11
                          local.get 30
                          i32.const 73728
                          i32.and
                          i32.const 8192
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 27
                          local.get 21
                          i32.le_s
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          i32.const 32
                          local.get 27
                          local.get 21
                          i32.sub
                          local.tee 20
                          i32.const 256
                          local.get 20
                          i32.const 256
                          i32.lt_u
                          local.tee 22
                          select
                          call $memset
                          drop
                          block  ;; label = @12
                            local.get 22
                            br_if 0 (;@12;)
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 624
                                i32.add
                                i32.const 256
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 20
                              i32.const -256
                              i32.add
                              local.tee 20
                              i32.const 255
                              i32.gt_u
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 624
                          i32.add
                          local.get 20
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 27
                        local.get 21
                        local.get 27
                        local.get 21
                        i32.gt_s
                        select
                        local.set 20
                        br 6 (;@4;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 35
                            local.get 5
                            i32.const 108
                            i32.add
                            call $frexp
                            local.tee 35
                            local.get 35
                            f64.add
                            local.tee 35
                            f64.const 0x0p+0 (;=0;)
                            f64.eq
                            br_if 0 (;@12;)
                            local.get 5
                            local.get 5
                            i32.load offset=108
                            local.tee 20
                            i32.const -1
                            i32.add
                            i32.store offset=108
                            local.get 31
                            i32.const 32
                            i32.or
                            local.tee 39
                            i32.const 97
                            i32.ne
                            br_if 1 (;@11;)
                            br 6 (;@6;)
                          end
                          local.get 31
                          i32.const 32
                          i32.or
                          local.tee 39
                          i32.const 97
                          i32.eq
                          br_if 5 (;@6;)
                          i32.const 6
                          local.get 24
                          local.get 24
                          i32.const 0
                          i32.lt_s
                          select
                          local.set 23
                          local.get 5
                          i32.load offset=108
                          local.set 25
                          br 1 (;@10;)
                        end
                        local.get 5
                        local.get 20
                        i32.const -29
                        i32.add
                        local.tee 25
                        i32.store offset=108
                        i32.const 6
                        local.get 24
                        local.get 24
                        i32.const 0
                        i32.lt_s
                        select
                        local.set 23
                        local.get 35
                        f64.const 0x1p+28 (;=2.68435e+08;)
                        f64.mul
                        local.set 35
                      end
                      local.get 5
                      i32.const 112
                      i32.add
                      local.get 16
                      local.get 25
                      i32.const 0
                      i32.lt_s
                      local.tee 40
                      select
                      local.tee 32
                      local.set 21
                      loop  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 35
                            f64.const 0x1p+32 (;=4.29497e+09;)
                            f64.lt
                            local.get 35
                            f64.const 0x0p+0 (;=0;)
                            f64.ge
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 35
                            i32.trunc_f64_u
                            local.set 20
                            br 1 (;@11;)
                          end
                          i32.const 0
                          local.set 20
                        end
                        local.get 21
                        local.get 20
                        i32.store
                        local.get 21
                        i32.const 4
                        i32.add
                        local.set 21
                        local.get 35
                        local.get 20
                        f64.convert_i32_u
                        f64.sub
                        f64.const 0x1.dcd65p+29 (;=1e+09;)
                        f64.mul
                        local.tee 35
                        f64.const 0x0p+0 (;=0;)
                        f64.ne
                        br_if 0 (;@10;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 25
                          i32.const 1
                          i32.ge_s
                          br_if 0 (;@11;)
                          local.get 21
                          local.set 20
                          local.get 32
                          local.set 22
                          br 1 (;@10;)
                        end
                        local.get 32
                        local.set 22
                        loop  ;; label = @11
                          local.get 25
                          i32.const 29
                          local.get 25
                          i32.const 29
                          i32.lt_u
                          select
                          local.set 25
                          block  ;; label = @12
                            local.get 21
                            i32.const -4
                            i32.add
                            local.tee 20
                            local.get 22
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 25
                            i64.extend_i32_u
                            local.set 34
                            i64.const 0
                            local.set 33
                            loop  ;; label = @13
                              local.get 20
                              local.get 20
                              i64.load32_u
                              local.get 34
                              i64.shl
                              local.get 33
                              i64.const 4294967295
                              i64.and
                              i64.add
                              local.tee 33
                              local.get 33
                              i64.const 1000000000
                              i64.div_u
                              local.tee 33
                              i64.const 1000000000
                              i64.mul
                              i64.sub
                              i64.store32
                              local.get 20
                              i32.const -4
                              i32.add
                              local.tee 20
                              local.get 22
                              i32.ge_u
                              br_if 0 (;@13;)
                            end
                            local.get 33
                            i32.wrap_i64
                            local.tee 20
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 22
                            i32.const -4
                            i32.add
                            local.tee 22
                            local.get 20
                            i32.store
                          end
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 21
                              local.tee 20
                              local.get 22
                              i32.le_u
                              br_if 1 (;@12;)
                              local.get 20
                              i32.const -4
                              i32.add
                              local.tee 21
                              i32.load
                              i32.eqz
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 5
                          local.get 5
                          i32.load offset=108
                          local.get 25
                          i32.sub
                          local.tee 25
                          i32.store offset=108
                          local.get 20
                          local.set 21
                          local.get 25
                          i32.const 0
                          i32.gt_s
                          br_if 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        local.get 25
                        i32.const -1
                        i32.gt_s
                        br_if 0 (;@10;)
                        local.get 23
                        i32.const 25
                        i32.add
                        i32.const 9
                        i32.div_u
                        i32.const 1
                        i32.add
                        local.set 41
                        loop  ;; label = @11
                          i32.const 0
                          local.get 25
                          i32.sub
                          local.tee 21
                          i32.const 9
                          local.get 21
                          i32.const 9
                          i32.lt_u
                          select
                          local.set 24
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 22
                              local.get 20
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 22
                              i32.load
                              local.set 21
                              br 1 (;@12;)
                            end
                            i32.const 1000000000
                            local.get 24
                            i32.shr_u
                            local.set 29
                            i32.const -1
                            local.get 24
                            i32.shl
                            i32.const -1
                            i32.xor
                            local.set 28
                            i32.const 0
                            local.set 25
                            local.get 22
                            local.set 21
                            loop  ;; label = @13
                              local.get 21
                              local.get 21
                              i32.load
                              local.tee 26
                              local.get 24
                              i32.shr_u
                              local.get 25
                              i32.add
                              i32.store
                              local.get 26
                              local.get 28
                              i32.and
                              local.get 29
                              i32.mul
                              local.set 25
                              local.get 21
                              i32.const 4
                              i32.add
                              local.tee 21
                              local.get 20
                              i32.lt_u
                              br_if 0 (;@13;)
                            end
                            local.get 22
                            i32.load
                            local.set 21
                            local.get 25
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 20
                            local.get 25
                            i32.store
                            local.get 20
                            i32.const 4
                            i32.add
                            local.set 20
                          end
                          local.get 5
                          local.get 5
                          i32.load offset=108
                          local.get 24
                          i32.add
                          local.tee 25
                          i32.store offset=108
                          local.get 32
                          local.get 22
                          local.get 21
                          i32.eqz
                          i32.const 2
                          i32.shl
                          i32.add
                          local.tee 22
                          local.get 39
                          i32.const 102
                          i32.eq
                          select
                          local.tee 21
                          local.get 41
                          i32.const 2
                          i32.shl
                          i32.add
                          local.get 20
                          local.get 20
                          local.get 21
                          i32.sub
                          i32.const 2
                          i32.shr_s
                          local.get 41
                          i32.gt_s
                          select
                          local.set 20
                          local.get 25
                          i32.const 0
                          i32.lt_s
                          br_if 0 (;@11;)
                        end
                      end
                      i32.const 0
                      local.set 26
                      block  ;; label = @10
                        local.get 22
                        local.get 20
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 32
                        local.get 22
                        i32.sub
                        i32.const 2
                        i32.shr_s
                        i32.const 9
                        i32.mul
                        local.set 26
                        local.get 22
                        i32.load
                        local.tee 25
                        i32.const 10
                        i32.lt_u
                        br_if 0 (;@10;)
                        i32.const 10
                        local.set 21
                        loop  ;; label = @11
                          local.get 26
                          i32.const 1
                          i32.add
                          local.set 26
                          local.get 25
                          local.get 21
                          i32.const 10
                          i32.mul
                          local.tee 21
                          i32.ge_u
                          br_if 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        local.get 23
                        i32.const 0
                        local.get 26
                        local.get 39
                        i32.const 102
                        i32.eq
                        select
                        i32.sub
                        local.get 23
                        i32.const 0
                        i32.ne
                        local.get 39
                        i32.const 103
                        i32.eq
                        local.tee 28
                        i32.and
                        i32.sub
                        local.tee 21
                        local.get 20
                        local.get 32
                        i32.sub
                        i32.const 2
                        i32.shr_s
                        i32.const 9
                        i32.mul
                        i32.const -9
                        i32.add
                        i32.ge_s
                        br_if 0 (;@10;)
                        local.get 21
                        i32.const 9216
                        i32.add
                        local.tee 25
                        i32.const 9
                        i32.div_s
                        local.tee 24
                        i32.const 2
                        i32.shl
                        local.get 15
                        local.get 14
                        local.get 40
                        select
                        i32.add
                        local.tee 40
                        i32.const -4096
                        i32.add
                        local.set 29
                        i32.const 10
                        local.set 21
                        block  ;; label = @11
                          local.get 25
                          local.get 24
                          i32.const 9
                          i32.mul
                          i32.sub
                          local.tee 24
                          i32.const 7
                          i32.gt_s
                          br_if 0 (;@11;)
                          i32.const 8
                          local.get 24
                          i32.sub
                          local.tee 41
                          i32.const 7
                          i32.and
                          local.set 25
                          i32.const 10
                          local.set 21
                          block  ;; label = @12
                            local.get 24
                            i32.const -1
                            i32.add
                            i32.const 7
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 41
                            i32.const -8
                            i32.and
                            local.set 24
                            i32.const 10
                            local.set 21
                            loop  ;; label = @13
                              local.get 21
                              i32.const 100000000
                              i32.mul
                              local.set 21
                              local.get 24
                              i32.const -8
                              i32.add
                              local.tee 24
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 25
                          i32.eqz
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            local.get 21
                            i32.const 10
                            i32.mul
                            local.set 21
                            local.get 25
                            i32.const -1
                            i32.add
                            local.tee 25
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 29
                        i32.const 4
                        i32.add
                        local.set 41
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 29
                            i32.load
                            local.tee 25
                            local.get 25
                            local.get 21
                            i32.div_u
                            local.tee 39
                            local.get 21
                            i32.mul
                            i32.sub
                            local.tee 24
                            br_if 0 (;@12;)
                            local.get 41
                            local.get 20
                            i32.eq
                            br_if 1 (;@11;)
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 39
                              i32.const 1
                              i32.and
                              br_if 0 (;@13;)
                              f64.const 0x1p+53 (;=9.0072e+15;)
                              local.set 35
                              local.get 21
                              i32.const 1000000000
                              i32.ne
                              br_if 1 (;@12;)
                              local.get 29
                              local.get 22
                              i32.le_u
                              br_if 1 (;@12;)
                              local.get 29
                              i32.const -4
                              i32.add
                              i32.load8_u
                              i32.const 1
                              i32.and
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            f64.const 0x1.0000000000001p+53 (;=9.0072e+15;)
                            local.set 35
                          end
                          f64.const 0x1p-1 (;=0.5;)
                          f64.const 0x1p+0 (;=1;)
                          f64.const 0x1.8p+0 (;=1.5;)
                          local.get 41
                          local.get 20
                          i32.eq
                          select
                          f64.const 0x1.8p+0 (;=1.5;)
                          local.get 24
                          local.get 21
                          i32.const 1
                          i32.shr_u
                          local.tee 41
                          i32.eq
                          select
                          local.get 24
                          local.get 41
                          i32.lt_u
                          select
                          local.set 42
                          block  ;; label = @12
                            local.get 37
                            br_if 0 (;@12;)
                            local.get 38
                            i32.load8_u
                            i32.const 45
                            i32.ne
                            br_if 0 (;@12;)
                            local.get 42
                            f64.neg
                            local.set 42
                            local.get 35
                            f64.neg
                            local.set 35
                          end
                          local.get 29
                          local.get 25
                          local.get 24
                          i32.sub
                          local.tee 25
                          i32.store
                          local.get 35
                          local.get 42
                          f64.add
                          local.get 35
                          f64.eq
                          br_if 0 (;@11;)
                          local.get 29
                          local.get 25
                          local.get 21
                          i32.add
                          local.tee 21
                          i32.store
                          block  ;; label = @12
                            local.get 21
                            i32.const 1000000000
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 40
                            i32.const -4100
                            i32.add
                            local.set 21
                            loop  ;; label = @13
                              local.get 21
                              i32.const 4
                              i32.add
                              i32.const 0
                              i32.store
                              block  ;; label = @14
                                local.get 21
                                local.get 22
                                i32.ge_u
                                br_if 0 (;@14;)
                                local.get 22
                                i32.const -4
                                i32.add
                                local.tee 22
                                i32.const 0
                                i32.store
                              end
                              local.get 21
                              local.get 21
                              i32.load
                              i32.const 1
                              i32.add
                              local.tee 25
                              i32.store
                              local.get 21
                              i32.const -4
                              i32.add
                              local.set 21
                              local.get 25
                              i32.const 999999999
                              i32.gt_u
                              br_if 0 (;@13;)
                            end
                            local.get 21
                            i32.const 4
                            i32.add
                            local.set 29
                          end
                          local.get 32
                          local.get 22
                          i32.sub
                          i32.const 2
                          i32.shr_s
                          i32.const 9
                          i32.mul
                          local.set 26
                          local.get 22
                          i32.load
                          local.tee 25
                          i32.const 10
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 10
                          local.set 21
                          loop  ;; label = @12
                            local.get 26
                            i32.const 1
                            i32.add
                            local.set 26
                            local.get 25
                            local.get 21
                            i32.const 10
                            i32.mul
                            local.tee 21
                            i32.ge_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 29
                        i32.const 4
                        i32.add
                        local.tee 21
                        local.get 20
                        local.get 20
                        local.get 21
                        i32.gt_u
                        select
                        local.set 20
                      end
                      local.get 20
                      local.get 32
                      i32.sub
                      local.set 21
                      block  ;; label = @10
                        loop  ;; label = @11
                          local.get 21
                          local.set 25
                          local.get 20
                          local.tee 29
                          local.get 22
                          i32.le_u
                          local.tee 24
                          br_if 1 (;@10;)
                          local.get 25
                          i32.const -4
                          i32.add
                          local.set 21
                          local.get 29
                          i32.const -4
                          i32.add
                          local.tee 20
                          i32.load
                          i32.eqz
                          br_if 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 28
                          br_if 0 (;@11;)
                          local.get 30
                          i32.const 8
                          i32.and
                          local.set 39
                          br 1 (;@10;)
                        end
                        local.get 26
                        i32.const -1
                        i32.xor
                        i32.const -1
                        local.get 23
                        i32.const 1
                        local.get 23
                        select
                        local.tee 20
                        local.get 26
                        i32.gt_s
                        local.get 26
                        i32.const -5
                        i32.gt_s
                        i32.and
                        local.tee 21
                        select
                        local.get 20
                        i32.add
                        local.set 23
                        i32.const -1
                        i32.const -2
                        local.get 21
                        select
                        local.get 31
                        i32.add
                        local.set 31
                        local.get 30
                        i32.const 8
                        i32.and
                        local.tee 39
                        br_if 0 (;@10;)
                        i32.const -9
                        local.set 20
                        block  ;; label = @11
                          local.get 24
                          br_if 0 (;@11;)
                          local.get 29
                          i32.const -4
                          i32.add
                          i32.load
                          local.tee 24
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 20
                          local.get 24
                          i32.const 10
                          i32.rem_u
                          br_if 0 (;@11;)
                          i32.const 10
                          local.set 21
                          i32.const 0
                          local.set 20
                          loop  ;; label = @12
                            local.get 20
                            i32.const -1
                            i32.add
                            local.set 20
                            local.get 24
                            local.get 21
                            i32.const 10
                            i32.mul
                            local.tee 21
                            i32.rem_u
                            i32.eqz
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 25
                        i32.const 2
                        i32.shr_s
                        i32.const 9
                        i32.mul
                        i32.const -9
                        i32.add
                        local.set 21
                        block  ;; label = @11
                          local.get 31
                          i32.const -33
                          i32.and
                          i32.const 70
                          i32.ne
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 39
                          local.get 23
                          local.get 21
                          local.get 20
                          i32.add
                          local.tee 20
                          i32.const 0
                          local.get 20
                          i32.const 0
                          i32.gt_s
                          select
                          local.tee 20
                          local.get 23
                          local.get 20
                          i32.lt_s
                          select
                          local.set 23
                          br 1 (;@10;)
                        end
                        i32.const 0
                        local.set 39
                        local.get 23
                        local.get 21
                        local.get 26
                        i32.add
                        local.get 20
                        i32.add
                        local.tee 20
                        i32.const 0
                        local.get 20
                        i32.const 0
                        i32.gt_s
                        select
                        local.tee 20
                        local.get 23
                        local.get 20
                        i32.lt_s
                        select
                        local.set 23
                      end
                      local.get 23
                      i32.const 2147483645
                      i32.const 2147483646
                      local.get 23
                      local.get 39
                      i32.or
                      local.tee 37
                      select
                      i32.gt_s
                      br_if 6 (;@3;)
                      local.get 23
                      local.get 37
                      i32.const 0
                      i32.ne
                      i32.add
                      i32.const 1
                      i32.add
                      local.set 41
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 31
                          i32.const -33
                          i32.and
                          i32.const 70
                          i32.ne
                          local.tee 40
                          br_if 0 (;@11;)
                          local.get 26
                          i32.const 2147483647
                          local.get 41
                          i32.sub
                          i32.gt_s
                          br_if 8 (;@3;)
                          local.get 26
                          i32.const 0
                          local.get 26
                          i32.const 0
                          i32.gt_s
                          select
                          local.set 20
                          br 1 (;@10;)
                        end
                        local.get 6
                        local.set 25
                        local.get 6
                        local.set 21
                        block  ;; label = @11
                          local.get 26
                          local.get 26
                          i32.const 31
                          i32.shr_s
                          local.tee 20
                          i32.add
                          local.get 20
                          i32.xor
                          local.tee 20
                          i32.eqz
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            local.get 21
                            i32.const -1
                            i32.add
                            local.tee 21
                            local.get 20
                            local.get 20
                            i32.const 10
                            i32.div_u
                            local.tee 24
                            i32.const 10
                            i32.mul
                            i32.sub
                            i32.const 48
                            i32.or
                            i32.store8
                            local.get 25
                            i32.const -1
                            i32.add
                            local.set 25
                            local.get 20
                            i32.const 9
                            i32.gt_u
                            local.set 28
                            local.get 24
                            local.set 20
                            local.get 28
                            br_if 0 (;@12;)
                          end
                        end
                        block  ;; label = @11
                          local.get 6
                          local.get 25
                          i32.sub
                          i32.const 1
                          i32.gt_s
                          br_if 0 (;@11;)
                          local.get 21
                          local.get 13
                          local.get 25
                          i32.sub
                          i32.add
                          local.tee 21
                          i32.const 48
                          local.get 12
                          local.get 25
                          i32.add
                          call $memset
                          drop
                        end
                        local.get 21
                        i32.const -2
                        i32.add
                        local.tee 28
                        local.get 31
                        i32.store8
                        local.get 21
                        i32.const -1
                        i32.add
                        i32.const 45
                        i32.const 43
                        local.get 26
                        i32.const 0
                        i32.lt_s
                        select
                        i32.store8
                        local.get 6
                        local.get 28
                        i32.sub
                        local.tee 20
                        i32.const 2147483647
                        local.get 41
                        i32.sub
                        i32.gt_s
                        br_if 7 (;@3;)
                      end
                      local.get 20
                      local.get 41
                      i32.add
                      local.tee 20
                      local.get 36
                      i32.const 2147483647
                      i32.xor
                      i32.gt_s
                      br_if 6 (;@3;)
                      local.get 20
                      local.get 36
                      i32.add
                      local.set 41
                      block  ;; label = @10
                        local.get 30
                        i32.const 73728
                        i32.and
                        local.tee 30
                        br_if 0 (;@10;)
                        local.get 27
                        local.get 41
                        i32.le_s
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 624
                        i32.add
                        i32.const 32
                        local.get 27
                        local.get 41
                        i32.sub
                        local.tee 20
                        i32.const 256
                        local.get 20
                        i32.const 256
                        i32.lt_u
                        local.tee 21
                        select
                        call $memset
                        drop
                        block  ;; label = @11
                          local.get 21
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              i32.const 256
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 20
                            i32.const -256
                            i32.add
                            local.tee 20
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 624
                        i32.add
                        local.get 20
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      block  ;; label = @10
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 38
                        local.get 36
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      block  ;; label = @10
                        local.get 30
                        i32.const 65536
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 27
                        local.get 41
                        i32.le_s
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 624
                        i32.add
                        i32.const 48
                        local.get 27
                        local.get 41
                        i32.sub
                        local.tee 20
                        i32.const 256
                        local.get 20
                        i32.const 256
                        i32.lt_u
                        local.tee 21
                        select
                        call $memset
                        drop
                        block  ;; label = @11
                          local.get 21
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              i32.const 256
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 20
                            i32.const -256
                            i32.add
                            local.tee 20
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 624
                        i32.add
                        local.get 20
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 40
                          br_if 0 (;@11;)
                          local.get 32
                          local.get 22
                          local.get 22
                          local.get 32
                          i32.gt_u
                          select
                          local.tee 28
                          local.set 24
                          loop  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 24
                                i32.load
                                local.tee 20
                                br_if 0 (;@14;)
                                local.get 11
                                local.set 22
                                local.get 11
                                local.set 21
                                br 1 (;@13;)
                              end
                              local.get 11
                              local.set 22
                              local.get 11
                              local.set 21
                              loop  ;; label = @14
                                local.get 21
                                i32.const -1
                                i32.add
                                local.tee 21
                                local.get 20
                                local.get 20
                                i32.const 10
                                i32.div_u
                                local.tee 25
                                i32.const 10
                                i32.mul
                                i32.sub
                                i32.const 48
                                i32.or
                                i32.store8
                                local.get 22
                                i32.const -1
                                i32.add
                                local.set 22
                                local.get 20
                                i32.const 9
                                i32.gt_u
                                local.set 26
                                local.get 25
                                local.set 20
                                local.get 26
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 24
                                local.get 28
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 21
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.le_u
                                br_if 1 (;@13;)
                                local.get 21
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.add
                                local.get 22
                                i32.sub
                                local.tee 21
                                i32.const 48
                                local.get 22
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.sub
                                call $memset
                                drop
                                br 1 (;@13;)
                              end
                              local.get 21
                              local.get 11
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 48
                              i32.store8 offset=88
                              local.get 10
                              local.set 21
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 21
                              local.get 11
                              local.get 21
                              i32.sub
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 24
                            i32.const 4
                            i32.add
                            local.tee 24
                            local.get 32
                            i32.le_u
                            br_if 0 (;@12;)
                          end
                          block  ;; label = @12
                            local.get 37
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 1553
                            i32.const 1
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 24
                              local.get 29
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 23
                              local.set 20
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 23
                              i32.const 1
                              i32.ge_s
                              br_if 0 (;@13;)
                              local.get 23
                              local.set 20
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 24
                                    i32.load
                                    local.tee 20
                                    br_if 0 (;@16;)
                                    local.get 11
                                    local.set 21
                                    local.get 11
                                    local.set 22
                                    br 1 (;@15;)
                                  end
                                  local.get 11
                                  local.set 22
                                  local.get 11
                                  local.set 21
                                  loop  ;; label = @16
                                    local.get 21
                                    i32.const -1
                                    i32.add
                                    local.tee 21
                                    local.get 20
                                    local.get 20
                                    i32.const 10
                                    i32.div_u
                                    local.tee 25
                                    i32.const 10
                                    i32.mul
                                    i32.sub
                                    i32.const 48
                                    i32.or
                                    i32.store8
                                    local.get 22
                                    i32.const -1
                                    i32.add
                                    local.set 22
                                    local.get 20
                                    i32.const 9
                                    i32.gt_u
                                    local.set 26
                                    local.get 25
                                    local.set 20
                                    local.get 26
                                    br_if 0 (;@16;)
                                  end
                                  local.get 21
                                  local.get 5
                                  i32.const 80
                                  i32.add
                                  i32.le_u
                                  br_if 1 (;@14;)
                                end
                                local.get 21
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.add
                                local.get 22
                                i32.sub
                                local.tee 21
                                i32.const 48
                                local.get 22
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.sub
                                call $memset
                                drop
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 21
                                local.get 23
                                i32.const 9
                                local.get 23
                                i32.const 9
                                i32.lt_s
                                select
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 23
                              i32.const -9
                              i32.add
                              local.set 20
                              local.get 24
                              i32.const 4
                              i32.add
                              local.tee 24
                              local.get 29
                              i32.ge_u
                              br_if 1 (;@12;)
                              local.get 23
                              i32.const 9
                              i32.gt_s
                              local.set 21
                              local.get 20
                              local.set 23
                              local.get 21
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 0
                          i32.const 48
                          local.get 20
                          i32.const 9
                          i32.add
                          i32.const 9
                          i32.const 0
                          call $pad
                          br 1 (;@10;)
                        end
                        block  ;; label = @11
                          local.get 23
                          i32.const 0
                          i32.lt_s
                          br_if 0 (;@11;)
                          local.get 29
                          local.get 22
                          i32.const 4
                          i32.add
                          local.get 29
                          local.get 22
                          i32.gt_u
                          select
                          local.set 29
                          local.get 22
                          local.set 24
                          loop  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 24
                                i32.load
                                local.tee 20
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 21
                                loop  ;; label = @15
                                  local.get 5
                                  i32.const 80
                                  i32.add
                                  local.get 21
                                  i32.add
                                  i32.const 8
                                  i32.add
                                  local.get 20
                                  local.get 20
                                  i32.const 10
                                  i32.div_u
                                  local.tee 25
                                  i32.const 10
                                  i32.mul
                                  i32.sub
                                  i32.const 48
                                  i32.or
                                  i32.store8
                                  local.get 21
                                  i32.const -1
                                  i32.add
                                  local.set 21
                                  local.get 20
                                  i32.const 9
                                  i32.gt_u
                                  local.set 26
                                  local.get 25
                                  local.set 20
                                  local.get 26
                                  br_if 0 (;@15;)
                                end
                                local.get 21
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 80
                                i32.add
                                local.get 21
                                i32.add
                                i32.const 9
                                i32.add
                                local.set 20
                                br 1 (;@13;)
                              end
                              local.get 5
                              i32.const 48
                              i32.store8 offset=88
                              local.get 10
                              local.set 20
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 24
                                local.get 22
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 20
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.le_u
                                br_if 1 (;@13;)
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.const 48
                                local.get 20
                                local.get 5
                                i32.const 80
                                i32.add
                                i32.sub
                                call $memset
                                drop
                                local.get 5
                                i32.const 80
                                i32.add
                                local.set 20
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 20
                                i32.const 1
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 20
                              i32.const 1
                              i32.add
                              local.set 20
                              block  ;; label = @14
                                local.get 39
                                br_if 0 (;@14;)
                                local.get 23
                                i32.const 1
                                i32.lt_s
                                br_if 1 (;@13;)
                              end
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 1553
                              i32.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 11
                            local.get 20
                            i32.sub
                            local.set 21
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 20
                              local.get 21
                              local.get 23
                              local.get 23
                              local.get 21
                              i32.gt_s
                              select
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 23
                            local.get 21
                            i32.sub
                            local.set 23
                            local.get 24
                            i32.const 4
                            i32.add
                            local.tee 24
                            local.get 29
                            i32.ge_u
                            br_if 1 (;@11;)
                            local.get 23
                            i32.const -1
                            i32.gt_s
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 0
                        i32.const 48
                        local.get 23
                        i32.const 18
                        i32.add
                        i32.const 18
                        i32.const 0
                        call $pad
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 28
                        local.get 6
                        local.get 28
                        i32.sub
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      block  ;; label = @10
                        local.get 30
                        i32.const 8192
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 27
                        local.get 41
                        i32.le_s
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 624
                        i32.add
                        i32.const 32
                        local.get 27
                        local.get 41
                        i32.sub
                        local.tee 20
                        i32.const 256
                        local.get 20
                        i32.const 256
                        i32.lt_u
                        local.tee 21
                        select
                        call $memset
                        drop
                        block  ;; label = @11
                          local.get 21
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 624
                              i32.add
                              i32.const 256
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 20
                            i32.const -256
                            i32.add
                            local.tee 20
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 624
                        i32.add
                        local.get 20
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      local.get 27
                      local.get 41
                      local.get 27
                      local.get 41
                      i32.gt_s
                      select
                      local.set 20
                      br 4 (;@5;)
                    end
                    i32.const 0
                    local.set 23
                    i32.const 1024
                    local.set 32
                    local.get 17
                    local.set 20
                    local.get 30
                    local.set 29
                    local.get 24
                    local.set 26
                  end
                  local.get 20
                  local.get 21
                  i32.sub
                  local.tee 24
                  local.get 26
                  local.get 26
                  local.get 24
                  i32.lt_s
                  select
                  local.tee 28
                  i32.const 2147483647
                  local.get 23
                  i32.sub
                  i32.gt_s
                  br_if 4 (;@3;)
                  local.get 23
                  local.get 28
                  i32.add
                  local.tee 25
                  local.get 27
                  local.get 27
                  local.get 25
                  i32.lt_s
                  select
                  local.tee 20
                  local.get 22
                  i32.gt_s
                  br_if 4 (;@3;)
                  block  ;; label = @8
                    local.get 29
                    i32.const 73728
                    i32.and
                    local.tee 29
                    br_if 0 (;@8;)
                    local.get 25
                    local.get 27
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    i32.const 32
                    local.get 20
                    local.get 25
                    i32.sub
                    local.tee 22
                    i32.const 256
                    local.get 22
                    i32.const 256
                    i32.lt_u
                    local.tee 30
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 30
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 22
                        i32.const -256
                        i32.add
                        local.tee 22
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    local.get 22
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 32
                    local.get 23
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 29
                    i32.const 65536
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 25
                    local.get 27
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    i32.const 48
                    local.get 20
                    local.get 25
                    i32.sub
                    local.tee 22
                    i32.const 256
                    local.get 22
                    i32.const 256
                    i32.lt_u
                    local.tee 23
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 23
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 22
                        i32.const -256
                        i32.add
                        local.tee 22
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    local.get 22
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 24
                    local.get 26
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    i32.const 48
                    local.get 28
                    local.get 24
                    i32.sub
                    local.tee 22
                    i32.const 256
                    local.get 22
                    i32.const 256
                    i32.lt_u
                    local.tee 26
                    select
                    call $memset
                    drop
                    block  ;; label = @9
                      local.get 26
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 112
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 22
                        i32.const -256
                        i32.add
                        local.tee 22
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 112
                    i32.add
                    local.get 22
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 21
                    local.get 24
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 29
                  i32.const 8192
                  i32.ne
                  br_if 3 (;@4;)
                  local.get 25
                  local.get 27
                  i32.ge_s
                  br_if 3 (;@4;)
                  local.get 5
                  i32.const 112
                  i32.add
                  i32.const 32
                  local.get 20
                  local.get 25
                  i32.sub
                  local.tee 21
                  i32.const 256
                  local.get 21
                  i32.const 256
                  i32.lt_u
                  local.tee 22
                  select
                  call $memset
                  drop
                  block  ;; label = @8
                    local.get 22
                    br_if 0 (;@8;)
                    loop  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 112
                        i32.add
                        i32.const 256
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      local.get 21
                      i32.const -256
                      i32.add
                      local.tee 21
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 0
                  i32.load8_u
                  i32.const 32
                  i32.and
                  br_if 3 (;@4;)
                  local.get 5
                  i32.const 112
                  i32.add
                  local.get 21
                  local.get 0
                  call $__fwritex
                  drop
                  br 3 (;@4;)
                end
                i32.const 0
                i32.const 28
                i32.store offset=5696
                br 4 (;@2;)
              end
              local.get 38
              local.get 31
              i32.const 26
              i32.shl
              i32.const 31
              i32.shr_s
              i32.const 9
              i32.and
              i32.add
              local.set 23
              block  ;; label = @6
                local.get 24
                i32.const 11
                i32.gt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 12
                    local.get 24
                    i32.sub
                    local.tee 20
                    i32.const 7
                    i32.and
                    local.tee 21
                    br_if 0 (;@8;)
                    f64.const 0x1p+4 (;=16;)
                    local.set 42
                    br 1 (;@7;)
                  end
                  local.get 24
                  i32.const -12
                  i32.add
                  local.set 20
                  f64.const 0x1p+4 (;=16;)
                  local.set 42
                  loop  ;; label = @8
                    local.get 20
                    i32.const 1
                    i32.add
                    local.set 20
                    local.get 42
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    local.set 42
                    local.get 21
                    i32.const -1
                    i32.add
                    local.tee 21
                    br_if 0 (;@8;)
                  end
                  i32.const 0
                  local.get 20
                  i32.sub
                  local.set 20
                end
                block  ;; label = @7
                  local.get 24
                  i32.const -5
                  i32.add
                  i32.const 7
                  i32.lt_u
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    local.get 42
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    local.set 42
                    local.get 20
                    i32.const -8
                    i32.add
                    local.tee 20
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 23
                  i32.load8_u
                  i32.const 45
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 42
                  local.get 35
                  f64.neg
                  local.get 42
                  f64.sub
                  f64.add
                  f64.neg
                  local.set 35
                  br 1 (;@6;)
                end
                local.get 35
                local.get 42
                f64.add
                local.get 42
                f64.sub
                local.set 35
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.load offset=108
                  local.tee 26
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 26
                  local.get 26
                  i32.const 31
                  i32.shr_s
                  local.tee 20
                  i32.add
                  local.get 20
                  i32.xor
                  local.set 20
                  i32.const 0
                  local.set 21
                  loop  ;; label = @8
                    local.get 5
                    i32.const 68
                    i32.add
                    local.get 21
                    i32.add
                    i32.const 11
                    i32.add
                    local.get 20
                    local.get 20
                    i32.const 10
                    i32.div_u
                    local.tee 22
                    i32.const 10
                    i32.mul
                    i32.sub
                    i32.const 48
                    i32.or
                    i32.store8
                    local.get 21
                    i32.const -1
                    i32.add
                    local.set 21
                    local.get 20
                    i32.const 9
                    i32.gt_u
                    local.set 25
                    local.get 22
                    local.set 20
                    local.get 25
                    br_if 0 (;@8;)
                  end
                  local.get 21
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 68
                  i32.add
                  local.get 21
                  i32.add
                  i32.const 12
                  i32.add
                  local.set 20
                  br 1 (;@6;)
                end
                local.get 5
                i32.const 48
                i32.store8 offset=79
                local.get 9
                local.set 20
              end
              local.get 36
              i32.const 2
              i32.or
              local.set 28
              local.get 31
              i32.const 32
              i32.and
              local.set 22
              local.get 20
              i32.const -2
              i32.add
              local.tee 29
              local.get 31
              i32.const 15
              i32.add
              i32.store8
              local.get 20
              i32.const -1
              i32.add
              i32.const 45
              i32.const 43
              local.get 26
              i32.const 0
              i32.lt_s
              select
              i32.store8
              local.get 30
              i32.const 8
              i32.and
              local.set 25
              local.get 5
              i32.const 80
              i32.add
              local.set 21
              loop  ;; label = @6
                local.get 21
                local.set 20
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 35
                    f64.abs
                    f64.const 0x1p+31 (;=2.14748e+09;)
                    f64.lt
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 35
                    i32.trunc_f64_s
                    local.set 21
                    br 1 (;@7;)
                  end
                  i32.const -2147483648
                  local.set 21
                end
                local.get 20
                local.get 21
                i32.const 5440
                i32.add
                i32.load8_u
                local.get 22
                i32.or
                i32.store8
                local.get 35
                local.get 21
                f64.convert_i32_s
                f64.sub
                f64.const 0x1p+4 (;=16;)
                f64.mul
                local.set 35
                block  ;; label = @7
                  local.get 20
                  i32.const 1
                  i32.add
                  local.tee 21
                  local.get 5
                  i32.const 80
                  i32.add
                  i32.sub
                  i32.const 1
                  i32.ne
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 25
                    br_if 0 (;@8;)
                    local.get 24
                    i32.const 0
                    i32.gt_s
                    br_if 0 (;@8;)
                    local.get 35
                    f64.const 0x0p+0 (;=0;)
                    f64.eq
                    br_if 1 (;@7;)
                  end
                  local.get 20
                  i32.const 46
                  i32.store8 offset=1
                  local.get 20
                  i32.const 2
                  i32.add
                  local.set 21
                end
                local.get 35
                f64.const 0x0p+0 (;=0;)
                f64.ne
                br_if 0 (;@6;)
              end
              i32.const 2147483645
              local.get 6
              local.get 29
              i32.sub
              local.tee 32
              local.get 28
              i32.add
              local.tee 20
              i32.sub
              local.get 24
              i32.lt_s
              br_if 2 (;@3;)
              local.get 24
              i32.const 2
              i32.add
              local.get 21
              local.get 5
              i32.const 80
              i32.add
              i32.sub
              local.tee 22
              local.get 8
              local.get 21
              i32.add
              local.get 24
              i32.lt_s
              select
              local.get 22
              local.get 24
              select
              local.tee 26
              local.get 20
              i32.add
              local.set 21
              block  ;; label = @6
                local.get 30
                i32.const 73728
                i32.and
                local.tee 25
                br_if 0 (;@6;)
                local.get 27
                local.get 21
                i32.le_s
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                i32.const 32
                local.get 27
                local.get 21
                i32.sub
                local.tee 20
                i32.const 256
                local.get 20
                i32.const 256
                i32.lt_u
                local.tee 24
                select
                call $memset
                drop
                block  ;; label = @7
                  local.get 24
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 624
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 20
                    i32.const -256
                    i32.add
                    local.tee 20
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                local.get 20
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 23
                local.get 28
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 25
                i32.const 65536
                i32.ne
                br_if 0 (;@6;)
                local.get 27
                local.get 21
                i32.le_s
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                i32.const 48
                local.get 27
                local.get 21
                i32.sub
                local.tee 20
                i32.const 256
                local.get 20
                i32.const 256
                i32.lt_u
                local.tee 24
                select
                call $memset
                drop
                block  ;; label = @7
                  local.get 24
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 624
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 20
                    i32.const -256
                    i32.add
                    local.tee 20
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                local.get 20
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 80
                i32.add
                local.get 22
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 26
                local.get 22
                i32.sub
                local.tee 20
                i32.const 1
                i32.lt_s
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                i32.const 48
                local.get 20
                i32.const 256
                local.get 20
                i32.const 256
                i32.lt_u
                local.tee 22
                select
                call $memset
                drop
                block  ;; label = @7
                  local.get 22
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 624
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 20
                    i32.const -256
                    i32.add
                    local.tee 20
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                local.get 20
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 29
                local.get 32
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 25
                i32.const 8192
                i32.ne
                br_if 0 (;@6;)
                local.get 27
                local.get 21
                i32.le_s
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                i32.const 32
                local.get 27
                local.get 21
                i32.sub
                local.tee 20
                i32.const 256
                local.get 20
                i32.const 256
                i32.lt_u
                local.tee 22
                select
                call $memset
                drop
                block  ;; label = @7
                  local.get 22
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 624
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 20
                    i32.const -256
                    i32.add
                    local.tee 20
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 624
                i32.add
                local.get 20
                local.get 0
                call $__fwritex
                drop
              end
              local.get 27
              local.get 21
              local.get 27
              local.get 21
              i32.gt_s
              select
              local.set 20
            end
            local.get 20
            i32.const 0
            i32.ge_s
            br_if 0 (;@4;)
          end
        end
        i32.const 0
        i32.const 61
        i32.store offset=5696
      end
      i32.const -1
      local.set 19
    end
    local.get 5
    i32.const 880
    i32.add
    global.set $__stack_pointer
    local.get 19)
  (func $pop_arg (type 17) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 1
                                          i32.const -9
                                          i32.add
                                          br_table 17 (;@2;) 0 (;@19;) 1 (;@18;) 4 (;@15;) 2 (;@17;) 3 (;@16;) 5 (;@14;) 6 (;@13;) 7 (;@12;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 11 (;@8;) 12 (;@7;) 13 (;@6;) 14 (;@5;) 15 (;@4;) 16 (;@3;) 18 (;@1;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 1
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 0
                                        local.get 1
                                        i64.load32_s
                                        i64.store
                                        return
                                      end
                                      local.get 2
                                      local.get 2
                                      i32.load
                                      local.tee 1
                                      i32.const 4
                                      i32.add
                                      i32.store
                                      local.get 0
                                      local.get 1
                                      i64.load32_u
                                      i64.store
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    i32.load
                                    local.tee 1
                                    i32.const 4
                                    i32.add
                                    i32.store
                                    local.get 0
                                    local.get 1
                                    i64.load32_s
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  local.tee 1
                                  i32.const 4
                                  i32.add
                                  i32.store
                                  local.get 0
                                  local.get 1
                                  i64.load32_u
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                i32.const 7
                                i32.add
                                i32.const -8
                                i32.and
                                local.tee 1
                                i32.const 8
                                i32.add
                                i32.store
                                local.get 0
                                local.get 1
                                i64.load
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              i32.load
                              local.tee 1
                              i32.const 4
                              i32.add
                              i32.store
                              local.get 0
                              local.get 1
                              i64.load16_s
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            i32.load
                            local.tee 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 0
                            local.get 1
                            i64.load16_u
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          i32.load
                          local.tee 1
                          i32.const 4
                          i32.add
                          i32.store
                          local.get 0
                          local.get 1
                          i64.load8_s
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i64.load8_u
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      i32.const 7
                      i32.add
                      i32.const -8
                      i32.and
                      local.tee 1
                      i32.const 8
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    local.tee 1
                    i32.const 4
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load32_u
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  i32.const 7
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 1
                  i32.const 8
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i32.load
                i32.const 7
                i32.add
                i32.const -8
                i32.and
                local.tee 1
                i32.const 8
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load
                i64.store
                return
              end
              local.get 2
              local.get 2
              i32.load
              local.tee 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load32_s
              i64.store
              return
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load32_u
            i64.store
            return
          end
          local.get 2
          local.get 2
          i32.load
          i32.const 7
          i32.add
          i32.const -8
          i32.and
          local.tee 1
          i32.const 8
          i32.add
          i32.store
          local.get 0
          local.get 1
          f64.load
          f64.store
          return
        end
        call $long_double_not_supported
        unreachable
      end
      local.get 2
      local.get 2
      i32.load
      local.tee 1
      i32.const 4
      i32.add
      i32.store
      local.get 0
      local.get 1
      i32.load
      i32.store
    end)
  (func $pad (type 18) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 256
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      local.get 2
      local.get 3
      i32.sub
      local.tee 2
      i32.const 256
      local.get 2
      i32.const 256
      i32.lt_u
      local.tee 4
      select
      call $memset
      local.set 3
      block  ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 32
            i32.and
            br_if 0 (;@4;)
            local.get 3
            i32.const 256
            local.get 0
            call $__fwritex
            drop
          end
          local.get 2
          i32.const -256
          i32.add
          local.tee 2
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.load8_u
      i32.const 32
      i32.and
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      local.get 0
      call $__fwritex
      drop
    end
    local.get 5
    i32.const 256
    i32.add
    global.set $__stack_pointer)
  (func $long_double_not_supported (type 12)
    i32.const 1758
    i32.const 5456
    call $fputs
    drop
    call $abort
    unreachable)
  (func $feof (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 4
    i32.shr_u
    i32.const 1
    i32.and)
  (func $__stdout_write (type 2) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 2
    i32.store offset=32
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=56
      call $__isatty
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.store offset=64
    end
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write)
  (func $memcmp (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 4
          local.get 1
          i32.load8_u
          local.tee 5
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3)
  (func $strdup (type 0) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      call $memcpy
      drop
    end
    local.get 2)
  (func $strnlen (type 3) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 2
    local.get 0
    i32.sub
    local.get 1
    local.get 2
    select)
  (func $strcmp (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 1
    i32.load8_u
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.const 255
      i32.and
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.load8_u
        local.set 2
        local.get 0
        i32.load8_u
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 2
        i32.const 255
        i32.and
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 3
    local.get 2
    i32.const 255
    i32.and
    i32.sub)
  (func $memcpy (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 32
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 1
          i32.add
          local.set 4
          local.get 1
          i32.const 1
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const -2
          i32.add
          local.set 3
          local.get 0
          i32.const 2
          i32.add
          local.set 4
          local.get 1
          i32.const 2
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=2
          i32.store8 offset=2
          local.get 2
          i32.const -3
          i32.add
          local.set 3
          local.get 0
          i32.const 3
          i32.add
          local.set 4
          local.get 1
          i32.const 3
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=3
          i32.store8 offset=3
          local.get 2
          i32.const -4
          i32.add
          local.set 3
          local.get 0
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          i32.const 4
          i32.add
          local.set 5
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        local.get 0
        return
      end
      local.get 2
      local.set 3
      local.get 0
      local.set 4
      local.get 1
      local.set 5
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 3
        i32.and
        local.tee 2
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const -16
              i32.add
              local.tee 2
              i32.const 16
              i32.and
              br_if 0 (;@5;)
              local.get 4
              local.get 5
              i64.load align=4
              i64.store align=4
              local.get 4
              local.get 5
              i64.load offset=8 align=4
              i64.store offset=8 align=4
              local.get 4
              i32.const 16
              i32.add
              local.set 4
              local.get 5
              i32.const 16
              i32.add
              local.set 5
              local.get 2
              local.set 3
            end
            local.get 2
            i32.const 16
            i32.lt_u
            br_if 1 (;@3;)
            loop  ;; label = @5
              local.get 4
              local.get 5
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 8
              i32.add
              local.get 5
              i32.const 8
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 16
              i32.add
              local.get 5
              i32.const 16
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 24
              i32.add
              local.get 5
              i32.const 24
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 32
              i32.add
              local.set 4
              local.get 5
              i32.const 32
              i32.add
              local.set 5
              local.get 3
              i32.const -32
              i32.add
              local.tee 3
              i32.const 15
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.set 2
        end
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i64.load align=4
          i64.store align=4
          local.get 5
          i32.const 8
          i32.add
          local.set 5
          local.get 4
          i32.const 8
          i32.add
          local.set 4
        end
        block  ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.set 5
          local.get 4
          i32.const 4
          i32.add
          local.set 4
        end
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 5
          i32.const 2
          i32.add
          local.set 5
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 5
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 32
                i32.lt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const -1
                    i32.add
                    br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 7 (;@1;)
                  end
                  local.get 4
                  local.get 5
                  i32.load
                  i32.store16 align=1
                  local.get 4
                  local.get 5
                  i32.const 2
                  i32.add
                  i32.load align=2
                  i32.store offset=2
                  local.get 4
                  local.get 5
                  i32.const 6
                  i32.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  i32.const 14
                  local.set 1
                  local.get 5
                  i32.const 14
                  i32.add
                  i32.load align=2
                  local.set 6
                  i32.const 18
                  local.set 2
                  i32.const 14
                  local.set 3
                  br 3 (;@4;)
                end
                local.get 4
                local.get 5
                i32.load
                i32.store8
                local.get 4
                local.get 5
                i32.const 1
                i32.add
                i32.load align=1
                i32.store offset=1
                local.get 4
                local.get 5
                i32.const 5
                i32.add
                i64.load align=1
                i64.store offset=5 align=4
                i32.const 13
                local.set 1
                local.get 5
                i32.const 13
                i32.add
                i32.load align=1
                local.set 6
                i32.const 15
                local.set 3
                i32.const 17
                local.set 2
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 3
                i32.const 16
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 5
                i32.load8_u
                i32.store8
                local.get 4
                local.get 5
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 5
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 5
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 5
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i32.const 16
                i32.add
                local.set 4
                local.get 5
                i32.const 16
                i32.add
                local.set 5
              end
              local.get 3
              i32.const 8
              i32.and
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 5
            i32.load
            local.tee 3
            i32.store8
            local.get 4
            local.get 3
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 3
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 5
            i32.const 3
            i32.add
            i32.load align=1
            i32.store offset=3
            local.get 4
            local.get 5
            i32.const 7
            i32.add
            i64.load align=1
            i64.store offset=7 align=4
            i32.const 15
            local.set 1
            local.get 5
            i32.const 15
            i32.add
            i32.load align=1
            local.set 6
            i32.const 13
            local.set 3
            i32.const 19
            local.set 2
          end
          local.get 4
          local.get 1
          i32.add
          local.get 6
          i32.store
          local.get 4
          local.get 2
          i32.add
          local.set 4
          local.get 5
          local.get 2
          i32.add
          local.set 5
        end
        local.get 4
        local.get 5
        i64.load align=1
        i64.store align=1
        local.get 4
        i32.const 8
        i32.add
        local.set 4
        local.get 5
        i32.const 8
        i32.add
        local.set 5
      end
      block  ;; label = @2
        local.get 3
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 5
        i32.load align=1
        i32.store align=1
        local.get 4
        i32.const 4
        i32.add
        local.set 4
        local.get 5
        i32.const 4
        i32.add
        local.set 5
      end
      block  ;; label = @2
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 5
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const 2
        i32.add
        local.set 4
        local.get 5
        i32.const 2
        i32.add
        local.set 5
      end
      local.get 3
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 5
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.const 33
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 5
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=24
      local.get 5
      local.get 3
      i32.store offset=20
      local.get 5
      local.get 3
      i32.store offset=16
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 5
      local.get 2
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 6
        i64.store
        local.get 2
        i32.const 24
        i32.add
        local.get 6
        i64.store
        local.get 2
        i32.const 16
        i32.add
        local.get 6
        i64.store
        local.get 2
        i32.const 8
        i32.add
        local.get 6
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const -32
        i32.add
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $strncmp (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load8_u
          local.tee 5
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          local.get 5
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        i32.load8_u
        local.set 4
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 4
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 255
    i32.and
    local.get 1
    i32.load8_u
    i32.sub)
  (func $strlen (type 0) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 1
      i32.const -4
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 4
        i32.add
        local.tee 1
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 2
      i32.const 255
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub)
  (func $__strchrnul (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.and
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.tee 3
              br_if 0 (;@5;)
              local.get 0
              return
            end
            local.get 3
            local.get 1
            i32.const 255
            i32.and
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            return
          end
          local.get 0
          local.get 0
          call $strlen
          i32.add
          return
        end
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 2
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 0
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.const -1
        i32.xor
        local.get 3
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 16843009
        i32.mul
        local.set 2
        loop  ;; label = @3
          local.get 3
          local.get 2
          i32.xor
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.load
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const -1
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.load8_u
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.const 255
        i32.and
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3)
  (func $strchr (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__strchrnul
    local.tee 0
    i32.const 0
    local.get 0
    i32.load8_u
    local.get 1
    i32.const 255
    i32.and
    i32.eq
    select)
  (func $memchr (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.get 1
              i32.const 255
              i32.and
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.set 4
              local.get 2
              local.set 5
              br 3 (;@2;)
            end
            local.get 2
            i32.const -1
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -2
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 2
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -3
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 3
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            i32.const -4
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            br 1 (;@3;)
          end
          local.get 2
          local.set 5
          local.get 0
          local.set 4
        end
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.load8_u
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 0 (;@2;)
        local.get 5
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 0
        loop  ;; label = @3
          local.get 4
          i32.load
          local.get 0
          i32.xor
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 5
          i32.const -4
          i32.add
          local.tee 5
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 255
      i32.and
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load8_u
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          return
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 5
        i32.const -1
        i32.add
        local.tee 5
        br_if 0 (;@2;)
      end
    end
    i32.const 0)
  (func $dummy.2 (type 3) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.2)
  (func $wctomb (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 0
    call $wcrtomb)
  (func $wcrtomb (type 2) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 127
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store8
        i32.const 1
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=7276
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 0 (;@4;)
            i32.const 0
            i32.const 25
            i32.store offset=5696
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store8
          i32.const 1
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const 2047
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8
          i32.const 2
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 55296
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -8192
            i32.and
            i32.const 57344
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 3
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const -65536
          i32.add
          i32.const 1048575
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=3
          local.get 0
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 4
          return
        end
        i32.const 0
        i32.const 25
        i32.store offset=5696
      end
      i32.const -1
      local.set 3
    end
    local.get 3)
  (func $frexp (type 19) (param f64 i32) (result f64)
    (local i64 i32)
    block  ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 2
      i64.const 52
      i64.shr_u
      i32.wrap_i64
      i32.const 2047
      i32.and
      local.tee 3
      i32.const 2047
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store
          local.get 0
          return
        end
        local.get 0
        f64.const 0x1p+64 (;=1.84467e+19;)
        f64.mul
        local.get 1
        call $frexp
        local.set 0
        local.get 1
        local.get 1
        i32.load
        i32.const -64
        i32.add
        i32.store
        local.get 0
        return
      end
      local.get 1
      local.get 3
      i32.const -1022
      i32.add
      i32.store
      local.get 2
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0)
  (func $_start.command_export (type 12)
    call $__wasm_call_ctors
    call $_start
    call $__wasm_call_dtors)
  (table (;0;) 6 6 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 72848))
  (export "memory" (memory 0))
  (export "_start" (func $_start.command_export))
  (elem (;0;) (i32.const 1) func $__stdio_close $__stdio_write $__stdio_seek $__stdio_read $__stdout_write)
  (data $.rodata (i32.const 1024) "-+   0X0x\00-0X+0X 0X-0x+0x 0x\00./test/test.txt\00./test\00%s\00Peter\00ftell(file) == end_position\00main\00nan\00inf\00stat_size == st.st_size\00wasi_advanced_file.c\00rwa\00ret == NAME_REPLACMENT_LEN\00NAN\00file != NULL\00INF\00ftell(file) == strlen(text) + ADDITIONAL_SPACE\00ftell(file) == 5 * ADDITIONAL_SPACE\00ftell(file) == 3 * ADDITIONAL_SPACE\00ftell(file) == strlen(text) + 2 * ADDITIONAL_SPACE\00plaintext_size == 13\00is_end_of_file == 1\00ret == 0\00strcmp(NAME_REPLACMENT, buffer) == 0\00ftell(file) == 0\00strncmp(text, buffer, strlen(text)) == 0\00stat_size != 0\00.\00w+\00ret == strlen(text)\00(null)\00ftell(file) == strlen(FILE_TEXT)\00ret == 0 || (ret == -1 && errno == EEXIST)\00Hello, world!\00Text read: %s\0a\00File current offset: %ld\0a\00Is the end of file? %d\0a\00Error! errno: %d\0a\00Support for formatting long double values is currently disabled.\0aTo enable it, add -lc-printscan-long-double to the link command.\0a\00The plaintext size is %ld.\0a\00[Test] Retrieving file offset passed.\0a\00[Test] Writing at specified offset passed.\0a\00[Test] Reading at specified offset passed.\0a\00[Test] End of file detection passed.\0a\00[Test] File writing passed.\0a\00[Test] File opening passed.\0a\00[Test] File reading passed.\0a\00[Test] Extension of the file size passed.\0a\00[Test] Closing file passed.\0a\00[Test] Delete file passed.\0a\00[Test] Allocation or more space passed.\0a\00Allocate more space to the file (fseek) from the start..\0a\00Reading from the file, up to 1000 characters..\0a\00Getting the size of the file on disk..\0a\00Force actual write of all the cached data to the disk..\0a\00Getting the plaintext size..\0a\00Writing to the file..\0a\00Closing from the file..\0a\00Moving the cursor to the start of the file..\0a\00Determine whether we reach the end of the file..\0a\00Delete the file..\0a\00Opening a file..\0a\00Allocate more space to the file (fseek) from the middle..\0a\00Moving to the end..\0a\00Reading %ld characters at offset %d..\0a\00Writing 5 characters at offset %d..\0a\00Move at the start of the file (fseek)..\0a\00Move at the middle of the file (fseek)..\0a\00Move at the end of the file (fseek)..\0a\00Allocate more space to the file (posix_fallocate)..\0a\00Allocate more space to the file (ftruncate)..\0a\00The file size is: %lld (stat), %lld (fstat).\0a\00Assertion failed: %s (%s: %s: %d)\0a\00All the tests passed!\0a\00\00\00\00`\00\00\00 \00\00\00@\00\00\00\80\00\00\00\c0\00\00\00\c0\00\00\00\a0\00\00\00`\00\00\00 \00\00\00@\00\00\00\80\00\00\00\c0\00\00\00\c0\00\00\00\a0\00\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05\00\00\00\00\00\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF")
  (data $.data (i32.const 5456) "\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\03\00\00\00P\18\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00P\15\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\03\00\00\00h\18\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\c8\15\00\00"))
