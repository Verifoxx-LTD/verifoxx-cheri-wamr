(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i64 i32) (result i64)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i64) (result i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;7;) (func (param i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func))
  (type (;11;) (func (param i32 i32 i32)))
  (type (;12;) (func (param i32) (result i64)))
  (type (;13;) (func (param i32 i32)))
  (type (;14;) (func (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32)))
  (type (;16;) (func (param i32 i32 i32 i32 i32)))
  (type (;17;) (func (param f64 i32) (result f64)))
  (import "wasi_snapshot_preview1" "sock_bind" (func $__imported_wasi_snapshot_preview1_sock_bind (type 2)))
  (import "wasi_snapshot_preview1" "sock_connect" (func $__imported_wasi_snapshot_preview1_sock_connect (type 2)))
  (import "wasi_snapshot_preview1" "sock_listen" (func $__imported_wasi_snapshot_preview1_sock_listen (type 2)))
  (import "wasi_snapshot_preview1" "sock_open" (func $__imported_wasi_snapshot_preview1_sock_open (type 3)))
  (import "wasi_snapshot_preview1" "sock_addr_remote" (func $__imported_wasi_snapshot_preview1_sock_addr_remote (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_recv_timeout" (func $__imported_wasi_snapshot_preview1_sock_set_recv_timeout (type 4)))
  (import "wasi_snapshot_preview1" "sock_set_send_timeout" (func $__imported_wasi_snapshot_preview1_sock_set_send_timeout (type 4)))
  (import "wasi_snapshot_preview1" "sock_set_send_buf_size" (func $__imported_wasi_snapshot_preview1_sock_set_send_buf_size (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_recv_buf_size" (func $__imported_wasi_snapshot_preview1_sock_set_recv_buf_size (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_keep_alive" (func $__imported_wasi_snapshot_preview1_sock_set_keep_alive (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_reuse_addr" (func $__imported_wasi_snapshot_preview1_sock_set_reuse_addr (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_reuse_port" (func $__imported_wasi_snapshot_preview1_sock_set_reuse_port (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_linger" (func $__imported_wasi_snapshot_preview1_sock_set_linger (type 0)))
  (import "wasi_snapshot_preview1" "sock_set_broadcast" (func $__imported_wasi_snapshot_preview1_sock_set_broadcast (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_tcp_no_delay" (func $__imported_wasi_snapshot_preview1_sock_set_tcp_no_delay (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_tcp_keep_idle" (func $__imported_wasi_snapshot_preview1_sock_set_tcp_keep_idle (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_tcp_keep_intvl" (func $__imported_wasi_snapshot_preview1_sock_set_tcp_keep_intvl (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_tcp_fastopen_connect" (func $__imported_wasi_snapshot_preview1_sock_set_tcp_fastopen_connect (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_tcp_quick_ack" (func $__imported_wasi_snapshot_preview1_sock_set_tcp_quick_ack (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_ip_multicast_loop" (func $__imported_wasi_snapshot_preview1_sock_set_ip_multicast_loop (type 0)))
  (import "wasi_snapshot_preview1" "sock_set_ip_add_membership" (func $__imported_wasi_snapshot_preview1_sock_set_ip_add_membership (type 0)))
  (import "wasi_snapshot_preview1" "sock_set_ip_drop_membership" (func $__imported_wasi_snapshot_preview1_sock_set_ip_drop_membership (type 0)))
  (import "wasi_snapshot_preview1" "sock_set_ip_ttl" (func $__imported_wasi_snapshot_preview1_sock_set_ip_ttl (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_ip_multicast_ttl" (func $__imported_wasi_snapshot_preview1_sock_set_ip_multicast_ttl (type 2)))
  (import "wasi_snapshot_preview1" "sock_set_ipv6_only" (func $__imported_wasi_snapshot_preview1_sock_set_ipv6_only (type 2)))
  (import "wasi_snapshot_preview1" "args_get" (func $__imported_wasi_snapshot_preview1_args_get (type 2)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $__imported_wasi_snapshot_preview1_args_sizes_get (type 2)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__imported_wasi_snapshot_preview1_fd_close (type 5)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func $__imported_wasi_snapshot_preview1_fd_fdstat_get (type 2)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__imported_wasi_snapshot_preview1_fd_seek (type 6)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__imported_wasi_snapshot_preview1_fd_write (type 3)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 7)))
  (import "wasi_snapshot_preview1" "sock_accept" (func $__imported_wasi_snapshot_preview1_sock_accept (type 0)))
  (import "wasi_snapshot_preview1" "sock_recv" (func $__imported_wasi_snapshot_preview1_sock_recv (type 8)))
  (import "wasi_snapshot_preview1" "sock_send" (func $__imported_wasi_snapshot_preview1_sock_send (type 9)))
  (import "wasi_snapshot_preview1" "sock_shutdown" (func $__imported_wasi_snapshot_preview1_sock_shutdown (type 2)))
  (func $_start (type 10)
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
  (func $main (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 2208
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
    i32.store offset=2204
    local.get 4
    local.get 0
    i32.store offset=2200
    local.get 4
    local.get 1
    i32.store offset=2196
    i32.const 0
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=2180
    i32.const 1152
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    i32.const 1024
    local.set 10
    i32.const 0
    local.set 11
    local.get 9
    local.get 11
    local.get 10
    call $memset
    drop
    i32.const 1088
    local.set 12
    local.get 4
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.set 14
    i64.const 0
    local.set 15
    local.get 14
    local.get 15
    i64.store
    i32.const 56
    local.set 16
    local.get 14
    local.get 16
    i32.add
    local.set 17
    local.get 17
    local.get 15
    i64.store
    i32.const 48
    local.set 18
    local.get 14
    local.get 18
    i32.add
    local.set 19
    local.get 19
    local.get 15
    i64.store
    i32.const 40
    local.set 20
    local.get 14
    local.get 20
    i32.add
    local.set 21
    local.get 21
    local.get 15
    i64.store
    i32.const 32
    local.set 22
    local.get 14
    local.get 22
    i32.add
    local.set 23
    local.get 23
    local.get 15
    i64.store
    i32.const 24
    local.set 24
    local.get 14
    local.get 24
    i32.add
    local.set 25
    local.get 25
    local.get 15
    i64.store
    i32.const 16
    local.set 26
    local.get 14
    local.get 26
    i32.add
    local.set 27
    local.get 27
    local.get 15
    i64.store
    i32.const 8
    local.set 28
    local.get 14
    local.get 28
    i32.add
    local.set 29
    local.get 29
    local.get 15
    i64.store
    i32.const 1056
    local.set 30
    local.get 4
    local.get 30
    i32.add
    local.set 31
    local.get 31
    local.set 32
    i32.const 8
    local.set 33
    local.get 32
    local.get 33
    i32.add
    local.set 34
    i32.const 0
    local.set 35
    local.get 35
    i64.load offset=2312
    local.set 36
    local.get 34
    local.get 36
    i64.store
    local.get 35
    i64.load offset=2304
    local.set 37
    local.get 32
    local.get 37
    i64.store
    i32.const 32
    local.set 38
    local.get 4
    local.get 38
    i32.add
    local.set 39
    local.get 39
    local.set 40
    i32.const 1024
    local.set 41
    i32.const 0
    local.set 42
    local.get 40
    local.get 42
    local.get 41
    call $memset
    drop
    i32.const 32
    local.set 43
    local.get 4
    local.get 43
    i32.add
    local.set 44
    local.get 44
    local.set 45
    local.get 4
    local.get 45
    i32.store offset=28
    i32.const 0
    local.set 46
    local.get 4
    local.get 46
    i32.store8 offset=23
    i32.const 1
    local.set 47
    local.get 4
    local.get 47
    i32.store offset=16
    local.get 4
    i32.load offset=2200
    local.set 48
    i32.const 2
    local.set 49
    local.get 48
    local.set 50
    local.get 49
    local.set 51
    local.get 50
    local.get 51
    i32.ne
    local.set 52
    i32.const 1
    local.set 53
    local.get 52
    local.get 53
    i32.and
    local.set 54
    block  ;; label = @1
      block  ;; label = @2
        local.get 54
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 55
        local.get 55
        i32.load offset=2320
        local.set 56
        local.get 4
        i32.load offset=2196
        local.set 57
        local.get 57
        i32.load
        local.set 58
        local.get 4
        local.get 58
        i32.store
        i32.const 1946
        local.set 59
        local.get 56
        local.get 59
        local.get 4
        call $fprintf
        drop
        i32.const 1
        local.set 60
        local.get 4
        local.get 60
        i32.store offset=2204
        br 1 (;@1;)
      end
      local.get 4
      i32.load offset=2196
      local.set 61
      local.get 61
      i32.load offset=4
      local.set 62
      local.get 4
      local.get 62
      i32.store offset=24
      block  ;; label = @2
        loop  ;; label = @3
          local.get 4
          i32.load offset=24
          local.set 63
          local.get 63
          i32.load8_u
          local.set 64
          i32.const 0
          local.set 65
          i32.const 255
          local.set 66
          local.get 64
          local.get 66
          i32.and
          local.set 67
          i32.const 255
          local.set 68
          local.get 65
          local.get 68
          i32.and
          local.set 69
          local.get 67
          local.get 69
          i32.ne
          local.set 70
          i32.const 1
          local.set 71
          local.get 70
          local.get 71
          i32.and
          local.set 72
          local.get 72
          i32.eqz
          br_if 1 (;@2;)
          local.get 4
          i32.load offset=24
          local.set 73
          local.get 73
          i32.load8_u
          local.set 74
          i32.const 24
          local.set 75
          local.get 74
          local.get 75
          i32.shl
          local.set 76
          local.get 76
          local.get 75
          i32.shr_s
          local.set 77
          local.get 77
          call $tolower
          local.set 78
          local.get 4
          i32.load offset=28
          local.set 79
          local.get 79
          local.get 78
          i32.store8
          local.get 4
          i32.load offset=24
          local.set 80
          i32.const 1
          local.set 81
          local.get 80
          local.get 81
          i32.add
          local.set 82
          local.get 4
          local.get 82
          i32.store offset=24
          local.get 4
          i32.load offset=28
          local.set 83
          i32.const 1
          local.set 84
          local.get 83
          local.get 84
          i32.add
          local.set 85
          local.get 4
          local.get 85
          i32.store offset=28
          br 0 (;@3;)
        end
      end
      i32.const 0
      local.set 86
      local.get 86
      i32.load offset=4532
      local.set 87
      i32.const 0
      local.set 88
      local.get 88
      local.get 87
      i32.store offset=4784
      i32.const 32
      local.set 89
      local.get 4
      local.get 89
      i32.add
      local.set 90
      local.get 90
      local.set 91
      i32.const 1053
      local.set 92
      local.get 91
      local.get 92
      call $strcmp
      local.set 93
      block  ;; label = @2
        block  ;; label = @3
          local.get 93
          br_if 0 (;@3;)
          i32.const 1
          local.set 94
          local.get 4
          local.get 94
          i32.store8 offset=23
          i32.const 0
          local.set 95
          local.get 95
          i32.load offset=4528
          local.set 96
          i32.const 0
          local.set 97
          local.get 97
          local.get 96
          i32.store offset=4784
          br 1 (;@2;)
        end
        i32.const 32
        local.set 98
        local.get 4
        local.get 98
        i32.add
        local.set 99
        local.get 99
        local.set 100
        i32.const 1078
        local.set 101
        local.get 100
        local.get 101
        call $strcmp
        local.set 102
        block  ;; label = @3
          local.get 102
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 103
          local.get 103
          i32.load offset=2320
          local.set 104
          i32.const 1809
          local.set 105
          i32.const 0
          local.set 106
          local.get 104
          local.get 105
          local.get 106
          call $fprintf
          drop
          i32.const 1
          local.set 107
          local.get 4
          local.get 107
          i32.store offset=2204
          br 2 (;@1;)
        end
      end
      i32.const 1708
      local.set 108
      i32.const 0
      local.set 109
      local.get 108
      local.get 109
      call $printf
      drop
      i32.const 1
      local.set 110
      i32.const 6
      local.set 111
      i32.const 0
      local.set 112
      local.get 110
      local.get 111
      local.get 112
      call $socket
      local.set 113
      local.get 4
      local.get 113
      i32.store offset=2192
      i32.const 0
      local.set 114
      local.get 114
      local.set 115
      local.get 113
      local.set 116
      local.get 115
      local.get 116
      i32.gt_s
      local.set 117
      i32.const 1
      local.set 118
      local.get 117
      local.get 118
      i32.and
      local.set 119
      block  ;; label = @2
        local.get 119
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1301
        local.set 120
        local.get 120
        call $perror
        i32.const 1
        local.set 121
        local.get 4
        local.get 121
        i32.store offset=2204
        br 1 (;@1;)
      end
      i32.const 1743
      local.set 122
      i32.const 0
      local.set 123
      local.get 122
      local.get 123
      call $printf
      drop
      local.get 4
      i32.load offset=2192
      local.set 124
      i32.const 16
      local.set 125
      local.get 4
      local.get 125
      i32.add
      local.set 126
      local.get 126
      local.set 127
      i32.const 2147483647
      local.set 128
      i32.const 15
      local.set 129
      i32.const 4
      local.set 130
      local.get 124
      local.get 128
      local.get 129
      local.get 127
      local.get 130
      call $setsockopt
      local.set 131
      i32.const 0
      local.set 132
      local.get 132
      local.set 133
      local.get 131
      local.set 134
      local.get 133
      local.get 134
      i32.gt_s
      local.set 135
      i32.const 1
      local.set 136
      local.get 135
      local.get 136
      i32.and
      local.set 137
      block  ;; label = @2
        local.get 137
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1344
        local.set 138
        local.get 138
        call $perror
        i32.const 1
        local.set 139
        local.get 4
        local.get 139
        i32.store offset=2204
        br 1 (;@1;)
      end
      i32.const 1
      local.set 140
      local.get 4
      local.get 140
      i32.store16 offset=1056
      i32.const 1234
      local.set 141
      i32.const 65535
      local.set 142
      local.get 141
      local.get 142
      i32.and
      local.set 143
      local.get 143
      call $htons
      local.set 144
      local.get 4
      local.get 144
      i32.store16 offset=1058
      local.get 4
      i32.load8_u offset=23
      local.set 145
      i32.const 1
      local.set 146
      local.get 145
      local.get 146
      i32.and
      local.set 147
      block  ;; label = @2
        block  ;; label = @3
          local.get 147
          i32.eqz
          br_if 0 (;@3;)
          i32.const 2130706433
          local.set 148
          local.get 148
          call $htonl
          local.set 149
          local.get 4
          local.get 149
          i32.store offset=1060
          i32.const 2104
          local.set 150
          i32.const 0
          local.set 151
          local.get 150
          local.get 151
          call $printf
          drop
          local.get 4
          i32.load offset=2192
          local.set 152
          i32.const 1056
          local.set 153
          local.get 4
          local.get 153
          i32.add
          local.set 154
          local.get 154
          local.set 155
          i32.const 16
          local.set 156
          local.get 152
          local.get 155
          local.get 156
          call $connect
          local.set 157
          i32.const 0
          local.set 158
          local.get 158
          local.set 159
          local.get 157
          local.set 160
          local.get 159
          local.get 160
          i32.gt_s
          local.set 161
          i32.const 1
          local.set 162
          local.get 161
          local.get 162
          i32.and
          local.set 163
          block  ;; label = @4
            local.get 163
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1322
            local.set 164
            local.get 164
            call $perror
            local.get 4
            i32.load offset=2192
            local.set 165
            local.get 165
            call $close
            drop
            i32.const 1
            local.set 166
            local.get 4
            local.get 166
            i32.store offset=2204
            br 3 (;@1;)
          end
          i32.const 1869
          local.set 167
          i32.const 0
          local.set 168
          local.get 167
          local.get 168
          call $printf
          drop
          local.get 4
          i32.load offset=2192
          local.set 169
          local.get 4
          local.get 169
          i32.store offset=2188
          local.get 4
          i32.load offset=2188
          local.set 170
          local.get 170
          call $do_send_test
          local.set 171
          i32.const 1
          local.set 172
          local.get 171
          local.get 172
          i32.and
          local.set 173
          block  ;; label = @4
            block  ;; label = @5
              local.get 173
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=2188
              local.set 174
              local.get 174
              call $do_receive_test
              local.set 175
              i32.const 1
              local.set 176
              local.get 175
              local.get 176
              i32.and
              local.set 177
              local.get 177
              br_if 1 (;@4;)
            end
            i32.const 1
            local.set 178
            local.get 4
            local.get 178
            i32.store offset=2204
            br 3 (;@1;)
          end
          br 1 (;@2;)
        end
        i32.const 0
        local.set 179
        local.get 179
        call $htonl
        local.set 180
        local.get 4
        local.get 180
        i32.store offset=1060
        i32.const 1723
        local.set 181
        i32.const 0
        local.set 182
        local.get 181
        local.get 182
        call $printf
        drop
        local.get 4
        i32.load offset=2192
        local.set 183
        i32.const 1056
        local.set 184
        local.get 4
        local.get 184
        i32.add
        local.set 185
        local.get 185
        local.set 186
        i32.const 16
        local.set 187
        local.get 183
        local.get 186
        local.get 187
        call $bind
        local.set 188
        i32.const 0
        local.set 189
        local.get 189
        local.set 190
        local.get 188
        local.set 191
        local.get 190
        local.get 191
        i32.gt_s
        local.set 192
        i32.const 1
        local.set 193
        local.get 192
        local.get 193
        i32.and
        local.set 194
        block  ;; label = @3
          local.get 194
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1438
          local.set 195
          local.get 195
          call $perror
          local.get 4
          i32.load offset=2192
          local.set 196
          local.get 196
          call $close
          drop
          i32.const 1
          local.set 197
          local.get 4
          local.get 197
          i32.store offset=2204
          br 2 (;@1;)
        end
        i32.const 1686
        local.set 198
        i32.const 0
        local.set 199
        local.get 198
        local.get 199
        call $printf
        drop
        local.get 4
        i32.load offset=2192
        local.set 200
        i32.const 1
        local.set 201
        local.get 200
        local.get 201
        call $listen
        local.set 202
        i32.const 0
        local.set 203
        local.get 203
        local.set 204
        local.get 202
        local.set 205
        local.get 204
        local.get 205
        i32.gt_s
        local.set 206
        i32.const 1
        local.set 207
        local.get 206
        local.get 207
        i32.and
        local.set 208
        block  ;; label = @3
          local.get 208
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1402
          local.set 209
          local.get 209
          call $perror
          local.get 4
          i32.load offset=2192
          local.set 210
          local.get 210
          call $close
          drop
          i32.const 1
          local.set 211
          local.get 4
          local.get 211
          i32.store offset=2204
          br 2 (;@1;)
        end
        i32.const 2133
        local.set 212
        i32.const 0
        local.set 213
        local.get 212
        local.get 213
        call $printf
        drop
        i32.const 16
        local.set 214
        local.get 4
        local.get 214
        i32.store offset=12
        local.get 4
        i32.load offset=2192
        local.set 215
        i32.const 1056
        local.set 216
        local.get 4
        local.get 216
        i32.add
        local.set 217
        local.get 217
        local.set 218
        i32.const 12
        local.set 219
        local.get 4
        local.get 219
        i32.add
        local.set 220
        local.get 220
        local.set 221
        local.get 215
        local.get 218
        local.get 221
        call $accept
        local.set 222
        local.get 4
        local.get 222
        i32.store offset=2188
        i32.const 0
        local.set 223
        local.get 223
        local.set 224
        local.get 222
        local.set 225
        local.get 224
        local.get 225
        i32.gt_s
        local.set 226
        i32.const 1
        local.set 227
        local.get 226
        local.get 227
        i32.and
        local.set 228
        block  ;; label = @3
          local.get 228
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1370
          local.set 229
          local.get 229
          call $perror
          local.get 4
          i32.load offset=2192
          local.set 230
          local.get 230
          call $close
          drop
          i32.const 1
          local.set 231
          local.get 4
          local.get 231
          i32.store offset=2204
          br 2 (;@1;)
        end
        i32.const 2269
        local.set 232
        i32.const 0
        local.set 233
        local.get 232
        local.get 233
        call $printf
        drop
        local.get 4
        i32.load offset=2188
        local.set 234
        local.get 234
        call $do_receive_test
        local.set 235
        i32.const 1
        local.set 236
        local.get 235
        local.get 236
        i32.and
        local.set 237
        block  ;; label = @3
          block  ;; label = @4
            local.get 237
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.load offset=2188
            local.set 238
            local.get 238
            call $do_send_test
            local.set 239
            i32.const 1
            local.set 240
            local.get 239
            local.get 240
            i32.and
            local.set 241
            local.get 241
            br_if 1 (;@3;)
          end
          local.get 4
          i32.load offset=2192
          local.set 242
          i32.const 3
          local.set 243
          local.get 242
          local.get 243
          call $shutdown
          drop
          i32.const 1
          local.set 244
          local.get 4
          local.get 244
          i32.store offset=2204
          br 2 (;@1;)
        end
      end
      i32.const 2233
      local.set 245
      i32.const 0
      local.set 246
      local.get 245
      local.get 246
      call $printf
      drop
      local.get 4
      i32.load offset=2188
      local.set 247
      local.get 247
      call $close
      drop
      local.get 4
      i32.load8_u offset=23
      local.set 248
      i32.const 1
      local.set 249
      local.get 248
      local.get 249
      i32.and
      local.set 250
      block  ;; label = @2
        local.get 250
        br_if 0 (;@2;)
        local.get 4
        i32.load offset=2192
        local.set 251
        i32.const 3
        local.set 252
        local.get 251
        local.get 252
        call $shutdown
        drop
      end
      i32.const 2288
      local.set 253
      i32.const 0
      local.set 254
      local.get 253
      local.get 254
      call $printf
      drop
      i32.const 0
      local.set 255
      local.get 4
      local.get 255
      i32.store offset=2204
    end
    local.get 4
    i32.load offset=2204
    local.set 256
    i32.const 2208
    local.set 257
    local.get 4
    local.get 257
    i32.add
    local.set 258
    local.get 258
    global.set $__stack_pointer
    local.get 256
    return)
  (func $do_send_test (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    i32.const 1787
    local.set 4
    i32.const 0
    local.set 5
    local.get 4
    local.get 5
    call $printf
    drop
    local.get 3
    i32.load offset=8
    local.set 6
    i32.const 0
    local.set 7
    local.get 7
    i32.load offset=4784
    local.set 8
    i32.const 0
    local.set 9
    local.get 9
    i32.load offset=4784
    local.set 10
    local.get 10
    call $strlen
    local.set 11
    i32.const 0
    local.set 12
    local.get 6
    local.get 8
    local.get 11
    local.get 12
    call $send
    local.set 13
    local.get 3
    local.get 13
    i32.store offset=4
    i32.const 0
    local.set 14
    local.get 14
    local.set 15
    local.get 13
    local.set 16
    local.get 15
    local.get 16
    i32.gt_s
    local.set 17
    i32.const 1
    local.set 18
    local.get 17
    local.get 18
    i32.and
    local.set 19
    block  ;; label = @1
      block  ;; label = @2
        local.get 19
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1457
        local.set 20
        local.get 20
        call $perror
        local.get 3
        i32.load offset=8
        local.set 21
        local.get 21
        call $close
        drop
        i32.const 0
        local.set 22
        i32.const 1
        local.set 23
        local.get 22
        local.get 23
        i32.and
        local.set 24
        local.get 3
        local.get 24
        i32.store8 offset=15
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=4
      local.set 25
      local.get 3
      local.get 25
      i32.store
      i32.const 1880
      local.set 26
      local.get 26
      local.get 3
      call $printf
      drop
      i32.const 1
      local.set 27
      i32.const 1
      local.set 28
      local.get 27
      local.get 28
      i32.and
      local.set 29
      local.get 3
      local.get 29
      i32.store8 offset=15
    end
    local.get 3
    i32.load8_u offset=15
    local.set 30
    i32.const 1
    local.set 31
    local.get 30
    local.get 31
    i32.and
    local.set 32
    i32.const 16
    local.set 33
    local.get 3
    local.get 33
    i32.add
    local.set 34
    local.get 34
    global.set $__stack_pointer
    local.get 32
    return)
  (func $do_receive_test (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 1072
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=1064
    i32.const 1763
    local.set 4
    i32.const 0
    local.set 5
    local.get 4
    local.get 5
    call $printf
    drop
    local.get 3
    i32.load offset=1064
    local.set 6
    i32.const 32
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    i32.const 1024
    local.set 10
    i32.const 0
    local.set 11
    local.get 6
    local.get 9
    local.get 10
    local.get 11
    call $recv
    local.set 12
    local.get 3
    local.get 12
    i32.store offset=1060
    i32.const 0
    local.set 13
    local.get 13
    local.set 14
    local.get 12
    local.set 15
    local.get 14
    local.get 15
    i32.gt_s
    local.set 16
    i32.const 1
    local.set 17
    local.get 16
    local.get 17
    i32.and
    local.set 18
    block  ;; label = @1
      block  ;; label = @2
        local.get 18
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1423
        local.set 19
        local.get 19
        call $perror
        local.get 3
        i32.load offset=1064
        local.set 20
        local.get 20
        call $close
        drop
        i32.const 0
        local.set 21
        i32.const 1
        local.set 22
        local.get 21
        local.get 22
        i32.and
        local.set 23
        local.get 3
        local.get 23
        i32.store8 offset=1071
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=1060
      local.set 24
      i32.const 0
      local.set 25
      local.get 25
      local.set 26
      local.get 24
      local.set 27
      local.get 26
      local.get 27
      i32.eq
      local.set 28
      i32.const 1
      local.set 29
      local.get 28
      local.get 29
      i32.and
      local.set 30
      block  ;; label = @2
        local.get 30
        i32.eqz
        br_if 0 (;@2;)
        i32.const 2249
        local.set 31
        i32.const 0
        local.set 32
        local.get 31
        local.get 32
        call $printf
        drop
        local.get 3
        i32.load offset=1064
        local.set 33
        local.get 33
        call $close
        drop
        i32.const 0
        local.set 34
        i32.const 1
        local.set 35
        local.get 34
        local.get 35
        i32.and
        local.set 36
        local.get 3
        local.get 36
        i32.store8 offset=1071
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=1060
      local.set 37
      local.get 3
      local.get 37
      i32.store
      i32.const 1911
      local.set 38
      local.get 38
      local.get 3
      call $printf
      drop
      local.get 3
      i32.load offset=1060
      local.set 39
      i32.const 32
      local.set 40
      local.get 3
      local.get 40
      i32.add
      local.set 41
      local.get 41
      local.set 42
      local.get 42
      local.get 39
      i32.add
      local.set 43
      i32.const 0
      local.set 44
      local.get 43
      local.get 44
      i32.store8
      i32.const 32
      local.set 45
      local.get 3
      local.get 45
      i32.add
      local.set 46
      local.get 46
      local.set 47
      local.get 3
      local.get 47
      i32.store offset=16
      i32.const 2209
      local.set 48
      i32.const 16
      local.set 49
      local.get 3
      local.get 49
      i32.add
      local.set 50
      local.get 48
      local.get 50
      call $printf
      drop
      i32.const 1
      local.set 51
      i32.const 1
      local.set 52
      local.get 51
      local.get 52
      i32.and
      local.set 53
      local.get 3
      local.get 53
      i32.store8 offset=1071
    end
    local.get 3
    i32.load8_u offset=1071
    local.set 54
    i32.const 1
    local.set 55
    local.get 54
    local.get 55
    i32.and
    local.set 56
    i32.const 1072
    local.set 57
    local.get 3
    local.get 57
    i32.add
    local.set 58
    local.get 58
    global.set $__stack_pointer
    local.get 56
    return)
  (func $accept (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=40
    local.get 5
    local.get 1
    i32.store offset=36
    local.get 5
    local.get 2
    i32.store offset=32
    i32.const 8
    local.set 6
    local.get 5
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    i64.const 0
    local.set 9
    local.get 8
    local.get 9
    i64.store align=4
    i32.const 16
    local.set 10
    local.get 8
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.get 9
    i64.store align=4
    i32.const 8
    local.set 12
    local.get 8
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.get 9
    i64.store align=4
    local.get 5
    i32.load offset=40
    local.set 14
    i32.const 0
    local.set 15
    i32.const 4
    local.set 16
    local.get 5
    local.get 16
    i32.add
    local.set 17
    local.get 17
    local.set 18
    i32.const 65535
    local.set 19
    local.get 15
    local.get 19
    i32.and
    local.set 20
    local.get 14
    local.get 20
    local.get 18
    call $__wasi_sock_accept
    local.set 21
    local.get 5
    local.get 21
    i32.store16 offset=2
    local.get 5
    i32.load16_u offset=2
    local.set 22
    i32.const 65535
    local.set 23
    local.get 22
    local.get 23
    i32.and
    local.set 24
    block  ;; label = @1
      block  ;; label = @2
        local.get 24
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=2
        local.set 25
        i32.const 65535
        local.set 26
        local.get 25
        local.get 26
        i32.and
        local.set 27
        i32.const 0
        local.set 28
        local.get 28
        local.get 27
        i32.store offset=5284
        i32.const -1
        local.set 29
        local.get 5
        local.get 29
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=4
      local.set 30
      local.get 5
      i32.load offset=36
      local.set 31
      local.get 5
      i32.load offset=32
      local.set 32
      local.get 30
      local.get 31
      local.get 32
      call $getpeername
      local.set 33
      i32.const -1
      local.set 34
      local.get 33
      local.set 35
      local.get 34
      local.set 36
      local.get 35
      local.get 36
      i32.eq
      local.set 37
      i32.const 1
      local.set 38
      local.get 37
      local.get 38
      i32.and
      local.set 39
      block  ;; label = @2
        local.get 39
        i32.eqz
        br_if 0 (;@2;)
        i32.const -1
        local.set 40
        local.get 5
        local.get 40
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=4
      local.set 41
      local.get 5
      local.get 41
      i32.store offset=44
    end
    local.get 5
    i32.load offset=44
    local.set 42
    i32.const 48
    local.set 43
    local.get 5
    local.get 43
    i32.add
    local.set 44
    local.get 44
    global.set $__stack_pointer
    local.get 42
    return)
  (func $getpeername (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=40
    local.get 5
    local.get 1
    i32.store offset=36
    local.get 5
    local.get 2
    i32.store offset=32
    i32.const 8
    local.set 6
    local.get 5
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    i64.const 0
    local.set 9
    local.get 8
    local.get 9
    i64.store align=4
    i32.const 16
    local.set 10
    local.get 8
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.get 9
    i64.store align=4
    i32.const 8
    local.set 12
    local.get 8
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.get 9
    i64.store align=4
    local.get 5
    i32.load offset=40
    local.set 14
    i32.const 8
    local.set 15
    local.get 5
    local.get 15
    i32.add
    local.set 16
    local.get 16
    local.set 17
    local.get 14
    local.get 17
    call $__wasi_sock_addr_remote
    local.set 18
    local.get 5
    local.get 18
    i32.store16 offset=6
    local.get 5
    i32.load16_u offset=6
    local.set 19
    i32.const 65535
    local.set 20
    local.get 19
    local.get 20
    i32.and
    local.set 21
    block  ;; label = @1
      block  ;; label = @2
        local.get 21
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=6
        local.set 22
        i32.const 65535
        local.set 23
        local.get 22
        local.get 23
        i32.and
        local.set 24
        i32.const 0
        local.set 25
        local.get 25
        local.get 24
        i32.store offset=5284
        i32.const -1
        local.set 26
        local.get 5
        local.get 26
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=36
      local.set 27
      local.get 5
      i32.load offset=32
      local.set 28
      i32.const 8
      local.set 29
      local.get 5
      local.get 29
      i32.add
      local.set 30
      local.get 30
      local.set 31
      local.get 31
      local.get 27
      local.get 28
      call $wasi_addr_to_sockaddr
      local.set 32
      local.get 5
      local.get 32
      i32.store16 offset=6
      local.get 5
      i32.load16_u offset=6
      local.set 33
      i32.const 65535
      local.set 34
      local.get 33
      local.get 34
      i32.and
      local.set 35
      block  ;; label = @2
        local.get 35
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=6
        local.set 36
        i32.const 65535
        local.set 37
        local.get 36
        local.get 37
        i32.and
        local.set 38
        i32.const 0
        local.set 39
        local.get 39
        local.get 38
        i32.store offset=5284
        i32.const -1
        local.set 40
        local.get 5
        local.get 40
        i32.store offset=44
        br 1 (;@1;)
      end
      i32.const 0
      local.set 41
      local.get 5
      local.get 41
      i32.store offset=44
    end
    local.get 5
    i32.load offset=44
    local.set 42
    i32.const 48
    local.set 43
    local.get 5
    local.get 43
    i32.add
    local.set 44
    local.get 44
    global.set $__stack_pointer
    local.get 42
    return)
  (func $__wasi_sock_addr_remote (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_addr_remote
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $wasi_addr_to_sockaddr (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 96
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=88
    local.get 5
    local.get 1
    i32.store offset=84
    local.get 5
    local.get 2
    i32.store offset=80
    local.get 5
    i32.load offset=88
    local.set 6
    local.get 6
    i32.load
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.gt_u
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;)
            end
            i32.const 64
            local.set 9
            local.get 5
            local.get 9
            i32.add
            local.set 10
            local.get 10
            local.set 11
            i64.const 0
            local.set 12
            local.get 11
            local.get 12
            i64.store
            i32.const 8
            local.set 13
            local.get 11
            local.get 13
            i32.add
            local.set 14
            local.get 14
            local.get 12
            i64.store
            local.get 5
            i32.load offset=88
            local.set 15
            local.get 15
            i32.load8_u offset=4
            local.set 16
            i32.const 255
            local.set 17
            local.get 16
            local.get 17
            i32.and
            local.set 18
            i32.const 24
            local.set 19
            local.get 18
            local.get 19
            i32.shl
            local.set 20
            local.get 5
            i32.load offset=88
            local.set 21
            local.get 21
            i32.load8_u offset=5
            local.set 22
            i32.const 255
            local.set 23
            local.get 22
            local.get 23
            i32.and
            local.set 24
            i32.const 16
            local.set 25
            local.get 24
            local.get 25
            i32.shl
            local.set 26
            local.get 20
            local.get 26
            i32.or
            local.set 27
            local.get 5
            i32.load offset=88
            local.set 28
            local.get 28
            i32.load8_u offset=6
            local.set 29
            i32.const 255
            local.set 30
            local.get 29
            local.get 30
            i32.and
            local.set 31
            i32.const 8
            local.set 32
            local.get 31
            local.get 32
            i32.shl
            local.set 33
            local.get 27
            local.get 33
            i32.or
            local.set 34
            local.get 5
            i32.load offset=88
            local.set 35
            local.get 35
            i32.load8_u offset=7
            local.set 36
            i32.const 255
            local.set 37
            local.get 36
            local.get 37
            i32.and
            local.set 38
            local.get 34
            local.get 38
            i32.or
            local.set 39
            local.get 5
            local.get 39
            i32.store offset=60
            i32.const 1
            local.set 40
            local.get 5
            local.get 40
            i32.store16 offset=64
            local.get 5
            i32.load offset=60
            local.set 41
            local.get 41
            call $htonl
            local.set 42
            local.get 5
            local.get 42
            i32.store offset=68
            local.get 5
            i32.load offset=88
            local.set 43
            local.get 43
            i32.load16_u offset=8
            local.set 44
            i32.const 65535
            local.set 45
            local.get 44
            local.get 45
            i32.and
            local.set 46
            local.get 46
            call $htons
            local.set 47
            local.get 5
            local.get 47
            i32.store16 offset=66
            local.get 5
            i32.load offset=84
            local.set 48
            i32.const 64
            local.set 49
            local.get 5
            local.get 49
            i32.add
            local.set 50
            local.get 50
            local.set 51
            local.get 51
            i64.load
            local.set 52
            local.get 48
            local.get 52
            i64.store
            i32.const 8
            local.set 53
            local.get 48
            local.get 53
            i32.add
            local.set 54
            local.get 51
            local.get 53
            i32.add
            local.set 55
            local.get 55
            i64.load
            local.set 56
            local.get 54
            local.get 56
            i64.store
            local.get 5
            i32.load offset=80
            local.set 57
            i32.const 16
            local.set 58
            local.get 57
            local.get 58
            i32.store
            br 2 (;@2;)
          end
          i32.const 16
          local.set 59
          local.get 5
          local.get 59
          i32.add
          local.set 60
          local.get 60
          local.set 61
          i64.const 0
          local.set 62
          local.get 61
          local.get 62
          i64.store
          i32.const 24
          local.set 63
          local.get 61
          local.get 63
          i32.add
          local.set 64
          local.get 64
          local.get 62
          i64.store
          i32.const 16
          local.set 65
          local.get 61
          local.get 65
          i32.add
          local.set 66
          local.get 66
          local.get 62
          i64.store
          i32.const 8
          local.set 67
          local.get 61
          local.get 67
          i32.add
          local.set 68
          local.get 68
          local.get 62
          i64.store
          i32.const 16
          local.set 69
          local.get 5
          local.get 69
          i32.add
          local.set 70
          local.get 70
          local.set 71
          i32.const 8
          local.set 72
          local.get 71
          local.get 72
          i32.add
          local.set 73
          local.get 5
          local.get 73
          i32.store offset=12
          local.get 5
          i32.load offset=88
          local.set 74
          local.get 74
          i32.load16_u offset=4
          local.set 75
          i32.const 65535
          local.set 76
          local.get 75
          local.get 76
          i32.and
          local.set 77
          local.get 77
          call $htons
          local.set 78
          local.get 5
          i32.load offset=12
          local.set 79
          local.get 79
          local.get 78
          i32.store16
          local.get 5
          i32.load offset=88
          local.set 80
          local.get 80
          i32.load16_u offset=6
          local.set 81
          i32.const 65535
          local.set 82
          local.get 81
          local.get 82
          i32.and
          local.set 83
          local.get 83
          call $htons
          local.set 84
          local.get 5
          i32.load offset=12
          local.set 85
          local.get 85
          local.get 84
          i32.store16 offset=2
          local.get 5
          i32.load offset=88
          local.set 86
          local.get 86
          i32.load16_u offset=8
          local.set 87
          i32.const 65535
          local.set 88
          local.get 87
          local.get 88
          i32.and
          local.set 89
          local.get 89
          call $htons
          local.set 90
          local.get 5
          i32.load offset=12
          local.set 91
          local.get 91
          local.get 90
          i32.store16 offset=4
          local.get 5
          i32.load offset=88
          local.set 92
          local.get 92
          i32.load16_u offset=10
          local.set 93
          i32.const 65535
          local.set 94
          local.get 93
          local.get 94
          i32.and
          local.set 95
          local.get 95
          call $htons
          local.set 96
          local.get 5
          i32.load offset=12
          local.set 97
          local.get 97
          local.get 96
          i32.store16 offset=6
          local.get 5
          i32.load offset=88
          local.set 98
          local.get 98
          i32.load16_u offset=12
          local.set 99
          i32.const 65535
          local.set 100
          local.get 99
          local.get 100
          i32.and
          local.set 101
          local.get 101
          call $htons
          local.set 102
          local.get 5
          i32.load offset=12
          local.set 103
          local.get 103
          local.get 102
          i32.store16 offset=8
          local.get 5
          i32.load offset=88
          local.set 104
          local.get 104
          i32.load16_u offset=14
          local.set 105
          i32.const 65535
          local.set 106
          local.get 105
          local.get 106
          i32.and
          local.set 107
          local.get 107
          call $htons
          local.set 108
          local.get 5
          i32.load offset=12
          local.set 109
          local.get 109
          local.get 108
          i32.store16 offset=10
          local.get 5
          i32.load offset=88
          local.set 110
          local.get 110
          i32.load16_u offset=16
          local.set 111
          i32.const 65535
          local.set 112
          local.get 111
          local.get 112
          i32.and
          local.set 113
          local.get 113
          call $htons
          local.set 114
          local.get 5
          i32.load offset=12
          local.set 115
          local.get 115
          local.get 114
          i32.store16 offset=12
          local.get 5
          i32.load offset=88
          local.set 116
          local.get 116
          i32.load16_u offset=18
          local.set 117
          i32.const 65535
          local.set 118
          local.get 117
          local.get 118
          i32.and
          local.set 119
          local.get 119
          call $htons
          local.set 120
          local.get 5
          i32.load offset=12
          local.set 121
          local.get 121
          local.get 120
          i32.store16 offset=14
          i32.const 2
          local.set 122
          local.get 5
          local.get 122
          i32.store16 offset=16
          local.get 5
          i32.load offset=88
          local.set 123
          local.get 123
          i32.load16_u offset=20
          local.set 124
          i32.const 65535
          local.set 125
          local.get 124
          local.get 125
          i32.and
          local.set 126
          local.get 126
          call $htons
          local.set 127
          local.get 5
          local.get 127
          i32.store16 offset=18
          local.get 5
          i32.load offset=84
          local.set 128
          i32.const 16
          local.set 129
          local.get 5
          local.get 129
          i32.add
          local.set 130
          local.get 130
          local.set 131
          local.get 131
          i64.load
          local.set 132
          local.get 128
          local.get 132
          i64.store
          i32.const 24
          local.set 133
          local.get 128
          local.get 133
          i32.add
          local.set 134
          local.get 131
          local.get 133
          i32.add
          local.set 135
          local.get 135
          i64.load
          local.set 136
          local.get 134
          local.get 136
          i64.store
          i32.const 16
          local.set 137
          local.get 128
          local.get 137
          i32.add
          local.set 138
          local.get 131
          local.get 137
          i32.add
          local.set 139
          local.get 139
          i64.load
          local.set 140
          local.get 138
          local.get 140
          i64.store
          i32.const 8
          local.set 141
          local.get 128
          local.get 141
          i32.add
          local.set 142
          local.get 131
          local.get 141
          i32.add
          local.set 143
          local.get 143
          i64.load
          local.set 144
          local.get 142
          local.get 144
          i64.store
          local.get 5
          i32.load offset=80
          local.set 145
          i32.const 32
          local.set 146
          local.get 145
          local.get 146
          i32.store
          br 1 (;@2;)
        end
        i32.const 5
        local.set 147
        local.get 5
        local.get 147
        i32.store16 offset=94
        br 1 (;@1;)
      end
      i32.const 0
      local.set 148
      local.get 5
      local.get 148
      i32.store16 offset=94
    end
    local.get 5
    i32.load16_u offset=94
    local.set 149
    i32.const 65535
    local.set 150
    local.get 149
    local.get 150
    i32.and
    local.set 151
    i32.const 96
    local.set 152
    local.get 5
    local.get 152
    i32.add
    local.set 153
    local.get 153
    global.set $__stack_pointer
    local.get 151
    return)
  (func $bind (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=40
    local.get 5
    local.get 1
    i32.store offset=36
    local.get 5
    local.get 2
    i32.store offset=32
    i32.const 8
    local.set 6
    local.get 5
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    i64.const 0
    local.set 9
    local.get 8
    local.get 9
    i64.store align=4
    i32.const 16
    local.set 10
    local.get 8
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.get 9
    i64.store align=4
    i32.const 8
    local.set 12
    local.get 8
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.get 9
    i64.store align=4
    local.get 5
    i32.load offset=36
    local.set 14
    local.get 5
    i32.load offset=32
    local.set 15
    i32.const 8
    local.set 16
    local.get 5
    local.get 16
    i32.add
    local.set 17
    local.get 17
    local.set 18
    local.get 14
    local.get 15
    local.get 18
    call $sockaddr_to_wasi_addr
    local.set 19
    local.get 5
    local.get 19
    i32.store16 offset=6
    local.get 5
    i32.load16_u offset=6
    local.set 20
    i32.const 65535
    local.set 21
    local.get 20
    local.get 21
    i32.and
    local.set 22
    block  ;; label = @1
      block  ;; label = @2
        local.get 22
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=6
        local.set 23
        i32.const 65535
        local.set 24
        local.get 23
        local.get 24
        i32.and
        local.set 25
        i32.const 0
        local.set 26
        local.get 26
        local.get 25
        i32.store offset=5284
        i32.const -1
        local.set 27
        local.get 5
        local.get 27
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=40
      local.set 28
      i32.const 8
      local.set 29
      local.get 5
      local.get 29
      i32.add
      local.set 30
      local.get 30
      local.set 31
      local.get 28
      local.get 31
      call $__wasi_sock_bind
      local.set 32
      local.get 5
      local.get 32
      i32.store16 offset=6
      local.get 5
      i32.load16_u offset=6
      local.set 33
      i32.const 65535
      local.set 34
      local.get 33
      local.get 34
      i32.and
      local.set 35
      block  ;; label = @2
        local.get 35
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=6
        local.set 36
        i32.const 65535
        local.set 37
        local.get 36
        local.get 37
        i32.and
        local.set 38
        i32.const 0
        local.set 39
        local.get 39
        local.get 38
        i32.store offset=5284
        i32.const -1
        local.set 40
        local.get 5
        local.get 40
        i32.store offset=44
        br 1 (;@1;)
      end
      i32.const 0
      local.set 41
      local.get 5
      local.get 41
      i32.store offset=44
    end
    local.get 5
    i32.load offset=44
    local.set 42
    i32.const 48
    local.set 43
    local.get 5
    local.get 43
    i32.add
    local.set 44
    local.get 44
    global.set $__stack_pointer
    local.get 42
    return)
  (func $sockaddr_to_wasi_addr (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=4
    i32.const 0
    local.set 6
    local.get 5
    local.get 6
    i32.store16 offset=2
    local.get 5
    i32.load offset=12
    local.set 7
    local.get 7
    i32.load16_u
    local.set 8
    i32.const 65535
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    i32.const 1
    local.set 11
    local.get 11
    local.set 12
    local.get 10
    local.set 13
    local.get 12
    local.get 13
    i32.eq
    local.set 14
    i32.const 1
    local.set 15
    local.get 14
    local.get 15
    i32.and
    local.set 16
    block  ;; label = @1
      block  ;; label = @2
        local.get 16
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load offset=8
        local.set 17
        i32.const 16
        local.set 18
        local.get 18
        local.set 19
        local.get 17
        local.set 20
        local.get 19
        local.get 20
        i32.le_u
        local.set 21
        i32.const 1
        local.set 22
        local.get 21
        local.get 22
        i32.and
        local.set 23
        block  ;; label = @3
          local.get 23
          br_if 0 (;@3;)
          i32.const 1216
          local.set 24
          i32.const 1469
          local.set 25
          i32.const 67
          local.set 26
          i32.const 1085
          local.set 27
          local.get 24
          local.get 25
          local.get 26
          local.get 27
          call $__assert_fail
          unreachable
        end
        local.get 5
        i32.load offset=12
        local.set 28
        local.get 28
        i32.load offset=4
        local.set 29
        local.get 5
        i32.load offset=12
        local.set 30
        local.get 30
        i32.load16_u offset=2
        local.set 31
        local.get 5
        i32.load offset=4
        local.set 32
        i32.const 65535
        local.set 33
        local.get 31
        local.get 33
        i32.and
        local.set 34
        local.get 29
        local.get 34
        local.get 32
        call $ipv4_addr_to_wasi_addr
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=12
      local.set 35
      local.get 35
      i32.load16_u
      local.set 36
      i32.const 65535
      local.set 37
      local.get 36
      local.get 37
      i32.and
      local.set 38
      i32.const 2
      local.set 39
      local.get 39
      local.set 40
      local.get 38
      local.set 41
      local.get 40
      local.get 41
      i32.eq
      local.set 42
      i32.const 1
      local.set 43
      local.get 42
      local.get 43
      i32.and
      local.set 44
      block  ;; label = @2
        block  ;; label = @3
          local.get 44
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.load offset=8
          local.set 45
          i32.const 32
          local.set 46
          local.get 46
          local.set 47
          local.get 45
          local.set 48
          local.get 47
          local.get 48
          i32.le_u
          local.set 49
          i32.const 1
          local.set 50
          local.get 49
          local.get 50
          i32.and
          local.set 51
          block  ;; label = @4
            local.get 51
            br_if 0 (;@4;)
            i32.const 1254
            local.set 52
            i32.const 1469
            local.set 53
            i32.const 74
            local.set 54
            i32.const 1085
            local.set 55
            local.get 52
            local.get 53
            local.get 54
            local.get 55
            call $__assert_fail
            unreachable
          end
          local.get 5
          i32.load offset=12
          local.set 56
          i32.const 8
          local.set 57
          local.get 56
          local.get 57
          i32.add
          local.set 58
          local.get 5
          i32.load offset=12
          local.set 59
          local.get 59
          i32.load16_u offset=2
          local.set 60
          local.get 5
          i32.load offset=4
          local.set 61
          i32.const 65535
          local.set 62
          local.get 60
          local.get 62
          i32.and
          local.set 63
          local.get 58
          local.get 63
          local.get 61
          call $ipv6_addr_to_wasi_addr
          br 1 (;@2;)
        end
        i32.const 5
        local.set 64
        local.get 5
        local.get 64
        i32.store16 offset=2
      end
    end
    local.get 5
    i32.load16_u offset=2
    local.set 65
    i32.const 65535
    local.set 66
    local.get 65
    local.get 66
    i32.and
    local.set 67
    i32.const 16
    local.set 68
    local.get 5
    local.get 68
    i32.add
    local.set 69
    local.get 69
    global.set $__stack_pointer
    local.get 67
    return)
  (func $__wasi_sock_bind (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_bind
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $ipv4_addr_to_wasi_addr (type 11) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store16 offset=10
    local.get 5
    local.get 2
    i32.store offset=4
    local.get 5
    i32.load offset=4
    local.set 6
    i32.const 0
    local.set 7
    local.get 6
    local.get 7
    i32.store
    local.get 5
    i32.load16_u offset=10
    local.set 8
    i32.const 65535
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    local.get 10
    call $ntohs
    local.set 11
    local.get 5
    i32.load offset=4
    local.set 12
    local.get 12
    local.get 11
    i32.store16 offset=8
    local.get 5
    i32.load offset=12
    local.set 13
    local.get 5
    i32.load offset=4
    local.set 14
    i32.const 4
    local.set 15
    local.get 14
    local.get 15
    i32.add
    local.set 16
    local.get 13
    local.get 16
    call $ipv4_addr_to_wasi_ip4_addr
    i32.const 16
    local.set 17
    local.get 5
    local.get 17
    i32.add
    local.set 18
    local.get 18
    global.set $__stack_pointer
    return)
  (func $ipv6_addr_to_wasi_addr (type 11) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store16 offset=10
    local.get 5
    local.get 2
    i32.store offset=4
    local.get 5
    i32.load offset=4
    local.set 6
    i32.const 1
    local.set 7
    local.get 6
    local.get 7
    i32.store
    local.get 5
    i32.load16_u offset=10
    local.set 8
    i32.const 65535
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    local.get 10
    call $ntohs
    local.set 11
    local.get 5
    i32.load offset=4
    local.set 12
    local.get 12
    local.get 11
    i32.store16 offset=20
    local.get 5
    i32.load offset=12
    local.set 13
    local.get 5
    i32.load offset=4
    local.set 14
    i32.const 4
    local.set 15
    local.get 14
    local.get 15
    i32.add
    local.set 16
    local.get 13
    local.get 16
    call $ipv6_addr_to_wasi_ipv6_addr
    i32.const 16
    local.set 17
    local.get 5
    local.get 17
    i32.add
    local.set 18
    local.get 18
    global.set $__stack_pointer
    return)
  (func $connect (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=40
    local.get 5
    local.get 1
    i32.store offset=36
    local.get 5
    local.get 2
    i32.store offset=32
    i32.const 8
    local.set 6
    local.get 5
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    i64.const 0
    local.set 9
    local.get 8
    local.get 9
    i64.store align=4
    i32.const 16
    local.set 10
    local.get 8
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.get 9
    i64.store align=4
    i32.const 8
    local.set 12
    local.get 8
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.get 9
    i64.store align=4
    local.get 5
    i32.load offset=36
    local.set 14
    i32.const 0
    local.set 15
    local.get 15
    local.set 16
    local.get 14
    local.set 17
    local.get 16
    local.get 17
    i32.eq
    local.set 18
    i32.const 1
    local.set 19
    local.get 18
    local.get 19
    i32.and
    local.set 20
    block  ;; label = @1
      block  ;; label = @2
        local.get 20
        i32.eqz
        br_if 0 (;@2;)
        i32.const 28
        local.set 21
        i32.const 0
        local.set 22
        local.get 22
        local.get 21
        i32.store offset=5284
        i32.const -1
        local.set 23
        local.get 5
        local.get 23
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=36
      local.set 24
      local.get 5
      i32.load offset=32
      local.set 25
      i32.const 8
      local.set 26
      local.get 5
      local.get 26
      i32.add
      local.set 27
      local.get 27
      local.set 28
      local.get 24
      local.get 25
      local.get 28
      call $sockaddr_to_wasi_addr
      local.set 29
      local.get 5
      local.get 29
      i32.store16 offset=6
      local.get 5
      i32.load16_u offset=6
      local.set 30
      i32.const 65535
      local.set 31
      local.get 30
      local.get 31
      i32.and
      local.set 32
      block  ;; label = @2
        local.get 32
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=6
        local.set 33
        i32.const 65535
        local.set 34
        local.get 33
        local.get 34
        i32.and
        local.set 35
        i32.const 0
        local.set 36
        local.get 36
        local.get 35
        i32.store offset=5284
        i32.const -1
        local.set 37
        local.get 5
        local.get 37
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=40
      local.set 38
      i32.const 8
      local.set 39
      local.get 5
      local.get 39
      i32.add
      local.set 40
      local.get 40
      local.set 41
      local.get 38
      local.get 41
      call $__wasi_sock_connect
      local.set 42
      local.get 5
      local.get 42
      i32.store16 offset=6
      local.get 5
      i32.load16_u offset=6
      local.set 43
      i32.const 65535
      local.set 44
      local.get 43
      local.get 44
      i32.and
      local.set 45
      block  ;; label = @2
        local.get 45
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=6
        local.set 46
        i32.const 65535
        local.set 47
        local.get 46
        local.get 47
        i32.and
        local.set 48
        i32.const 0
        local.set 49
        local.get 49
        local.get 48
        i32.store offset=5284
        i32.const -1
        local.set 50
        local.get 5
        local.get 50
        i32.store offset=44
        br 1 (;@1;)
      end
      i32.const 0
      local.set 51
      local.get 5
      local.get 51
      i32.store offset=44
    end
    local.get 5
    i32.load offset=44
    local.set 52
    i32.const 48
    local.set 53
    local.get 5
    local.get 53
    i32.add
    local.set 54
    local.get 54
    global.set $__stack_pointer
    local.get 52
    return)
  (func $__wasi_sock_connect (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_connect
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $listen (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    i32.load offset=8
    local.set 5
    local.get 4
    i32.load offset=4
    local.set 6
    local.get 5
    local.get 6
    call $__wasi_sock_listen
    local.set 7
    local.get 4
    local.get 7
    i32.store16 offset=2
    local.get 4
    i32.load16_u offset=2
    local.set 8
    i32.const 65535
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    block  ;; label = @1
      block  ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load16_u offset=2
        local.set 11
        i32.const 65535
        local.set 12
        local.get 11
        local.get 12
        i32.and
        local.set 13
        i32.const 0
        local.set 14
        local.get 14
        local.get 13
        i32.store offset=5284
        i32.const -1
        local.set 15
        local.get 4
        local.get 15
        i32.store offset=12
        br 1 (;@1;)
      end
      i32.const 0
      local.set 16
      local.get 4
      local.get 16
      i32.store offset=12
    end
    local.get 4
    i32.load offset=12
    local.set 17
    i32.const 16
    local.set 18
    local.get 4
    local.get 18
    i32.add
    local.set 19
    local.get 19
    global.set $__stack_pointer
    local.get 17
    return)
  (func $__wasi_sock_listen (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_listen
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $socket (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=40
    local.get 5
    local.get 1
    i32.store offset=36
    local.get 5
    local.get 2
    i32.store offset=32
    i32.const -1
    local.set 6
    local.get 5
    local.get 6
    i32.store offset=28
    local.get 5
    i32.load offset=40
    local.set 7
    i32.const 1
    local.set 8
    local.get 8
    local.set 9
    local.get 7
    local.set 10
    local.get 9
    local.get 10
    i32.eq
    local.set 11
    i32.const 1
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 13
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 14
          local.get 5
          local.get 14
          i32.store offset=16
          br 1 (;@2;)
        end
        local.get 5
        i32.load offset=40
        local.set 15
        i32.const 2
        local.set 16
        local.get 16
        local.set 17
        local.get 15
        local.set 18
        local.get 17
        local.get 18
        i32.eq
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.and
        local.set 21
        block  ;; label = @3
          block  ;; label = @4
            local.get 21
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 22
            local.get 5
            local.get 22
            i32.store offset=16
            br 1 (;@3;)
          end
          i32.const 50
          local.set 23
          local.get 5
          local.get 23
          i32.store offset=44
          br 2 (;@1;)
        end
      end
      local.get 5
      i32.load offset=36
      local.set 24
      i32.const 5
      local.set 25
      local.get 25
      local.set 26
      local.get 24
      local.set 27
      local.get 26
      local.get 27
      i32.eq
      local.set 28
      i32.const 1
      local.set 29
      local.get 28
      local.get 29
      i32.and
      local.set 30
      block  ;; label = @2
        block  ;; label = @3
          local.get 30
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 31
          local.get 5
          local.get 31
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 5
        i32.load offset=36
        local.set 32
        i32.const 6
        local.set 33
        local.get 33
        local.set 34
        local.get 32
        local.set 35
        local.get 34
        local.get 35
        i32.eq
        local.set 36
        i32.const 1
        local.set 37
        local.get 36
        local.get 37
        i32.and
        local.set 38
        block  ;; label = @3
          block  ;; label = @4
            local.get 38
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 39
            local.get 5
            local.get 39
            i32.store offset=12
            br 1 (;@3;)
          end
          i32.const 50
          local.set 40
          local.get 5
          local.get 40
          i32.store offset=44
          br 2 (;@1;)
        end
      end
      local.get 5
      i32.load offset=28
      local.set 41
      local.get 5
      i32.load offset=16
      local.set 42
      local.get 5
      i32.load offset=12
      local.set 43
      i32.const 24
      local.set 44
      local.get 5
      local.get 44
      i32.add
      local.set 45
      local.get 45
      local.set 46
      local.get 41
      local.get 42
      local.get 43
      local.get 46
      call $__wasi_sock_open
      local.set 47
      local.get 5
      local.get 47
      i32.store16 offset=22
      local.get 5
      i32.load16_u offset=22
      local.set 48
      i32.const 65535
      local.set 49
      local.get 48
      local.get 49
      i32.and
      local.set 50
      block  ;; label = @2
        local.get 50
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.load16_u offset=22
        local.set 51
        i32.const 65535
        local.set 52
        local.get 51
        local.get 52
        i32.and
        local.set 53
        i32.const 0
        local.set 54
        local.get 54
        local.get 53
        i32.store offset=5284
        i32.const -1
        local.set 55
        local.get 5
        local.get 55
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=24
      local.set 56
      local.get 5
      local.get 56
      i32.store offset=44
    end
    local.get 5
    i32.load offset=44
    local.set 57
    i32.const 48
    local.set 58
    local.get 5
    local.get 58
    i32.add
    local.set 59
    local.get 59
    global.set $__stack_pointer
    local.get 57
    return)
  (func $__wasi_sock_open (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 16
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=12
    local.get 6
    local.get 1
    i32.store offset=8
    local.get 6
    local.get 2
    i32.store offset=4
    local.get 6
    local.get 3
    i32.store
    local.get 6
    i32.load offset=12
    local.set 7
    local.get 6
    i32.load offset=8
    local.set 8
    local.get 6
    i32.load offset=4
    local.set 9
    local.get 6
    i32.load
    local.set 10
    local.get 7
    local.get 8
    local.get 9
    local.get 10
    call $__imported_wasi_snapshot_preview1_sock_open
    local.set 11
    i32.const 65535
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    i32.const 16
    local.set 14
    local.get 6
    local.get 14
    i32.add
    local.set 15
    local.get 15
    global.set $__stack_pointer
    local.get 13
    return)
  (func $setsockopt (type 9) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 5
    i32.const 32
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 7
    local.get 0
    i32.store offset=24
    local.get 7
    local.get 1
    i32.store offset=20
    local.get 7
    local.get 2
    i32.store offset=16
    local.get 7
    local.get 3
    i32.store offset=12
    local.get 7
    local.get 4
    i32.store offset=8
    local.get 7
    i32.load offset=20
    local.set 8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            i32.eqz
            br_if 0 (;@4;)
            i32.const 6
            local.set 9
            local.get 8
            local.get 9
            i32.eq
            local.set 10
            block  ;; label = @5
              local.get 10
              br_if 0 (;@5;)
              i32.const 41
              local.set 11
              local.get 8
              local.get 11
              i32.eq
              local.set 12
              local.get 12
              br_if 2 (;@3;)
              i32.const 2147483647
              local.set 13
              local.get 8
              local.get 13
              i32.ne
              local.set 14
              local.get 14
              br_if 3 (;@2;)
              local.get 7
              i32.load offset=24
              local.set 15
              local.get 7
              i32.load offset=16
              local.set 16
              local.get 7
              i32.load offset=12
              local.set 17
              local.get 7
              i32.load offset=8
              local.set 18
              local.get 15
              local.get 16
              local.get 17
              local.get 18
              call $set_sol_socket_option
              local.set 19
              local.get 7
              local.get 19
              i32.store offset=28
              br 4 (;@1;)
            end
            local.get 7
            i32.load offset=24
            local.set 20
            local.get 7
            i32.load offset=16
            local.set 21
            local.get 7
            i32.load offset=12
            local.set 22
            local.get 7
            i32.load offset=8
            local.set 23
            local.get 20
            local.get 21
            local.get 22
            local.get 23
            call $set_ipproto_tcp_option
            local.set 24
            local.get 7
            local.get 24
            i32.store offset=28
            br 3 (;@1;)
          end
          local.get 7
          i32.load offset=24
          local.set 25
          local.get 7
          i32.load offset=16
          local.set 26
          local.get 7
          i32.load offset=12
          local.set 27
          local.get 7
          i32.load offset=8
          local.set 28
          local.get 25
          local.get 26
          local.get 27
          local.get 28
          call $set_ipproto_ip_option
          local.set 29
          local.get 7
          local.get 29
          i32.store offset=28
          br 2 (;@1;)
        end
        local.get 7
        i32.load offset=24
        local.set 30
        local.get 7
        i32.load offset=16
        local.set 31
        local.get 7
        i32.load offset=12
        local.set 32
        local.get 7
        i32.load offset=8
        local.set 33
        local.get 30
        local.get 31
        local.get 32
        local.get 33
        call $set_ipproto_ipv6_option
        local.set 34
        local.get 7
        local.get 34
        i32.store offset=28
        br 1 (;@1;)
      end
      i32.const 58
      local.set 35
      local.get 7
      local.get 35
      i32.store16 offset=6
      local.get 7
      i32.load16_u offset=6
      local.set 36
      i32.const 65535
      local.set 37
      local.get 36
      local.get 37
      i32.and
      local.set 38
      block  ;; label = @2
        local.get 38
        i32.eqz
        br_if 0 (;@2;)
        local.get 7
        i32.load16_u offset=6
        local.set 39
        i32.const 65535
        local.set 40
        local.get 39
        local.get 40
        i32.and
        local.set 41
        i32.const 0
        local.set 42
        local.get 42
        local.get 41
        i32.store offset=5284
        i32.const -1
        local.set 43
        local.get 7
        local.get 43
        i32.store offset=28
        br 1 (;@1;)
      end
      local.get 7
      i32.load16_u offset=6
      local.set 44
      i32.const 65535
      local.set 45
      local.get 44
      local.get 45
      i32.and
      local.set 46
      local.get 7
      local.get 46
      i32.store offset=28
    end
    local.get 7
    i32.load offset=28
    local.set 47
    i32.const 32
    local.set 48
    local.get 7
    local.get 48
    i32.add
    local.set 49
    local.get 49
    global.set $__stack_pointer
    local.get 47
    return)
  (func $set_sol_socket_option (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i64 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i64 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 80
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=72
    local.get 6
    local.get 1
    i32.store offset=68
    local.get 6
    local.get 2
    i32.store offset=64
    local.get 6
    local.get 3
    i32.store offset=60
    local.get 6
    i32.load offset=68
    local.set 7
    i32.const -2
    local.set 8
    local.get 7
    local.get 8
    i32.add
    local.set 9
    i32.const 19
    local.set 10
    local.get 9
    local.get 10
    i32.gt_u
    drop
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
                          local.get 9
                          br_table 5 (;@6;) 9 (;@2;) 9 (;@2;) 9 (;@2;) 8 (;@3;) 2 (;@9;) 3 (;@8;) 4 (;@7;) 9 (;@2;) 9 (;@2;) 9 (;@2;) 7 (;@4;) 9 (;@2;) 6 (;@5;) 9 (;@2;) 9 (;@2;) 9 (;@2;) 9 (;@2;) 0 (;@11;) 1 (;@10;) 9 (;@2;)
                        end
                        local.get 6
                        i32.load offset=60
                        local.set 11
                        i32.const 16
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
                        block  ;; label = @11
                          local.get 17
                          br_if 0 (;@11;)
                          i32.const 1653
                          local.set 18
                          i32.const 1469
                          local.set 19
                          i32.const 773
                          local.set 20
                          i32.const 1125
                          local.set 21
                          local.get 18
                          local.get 19
                          local.get 20
                          local.get 21
                          call $__assert_fail
                          unreachable
                        end
                        local.get 6
                        i32.load offset=64
                        local.set 22
                        i32.const 8
                        local.set 23
                        local.get 22
                        local.get 23
                        i32.add
                        local.set 24
                        local.get 24
                        i64.load
                        local.set 25
                        i32.const 8
                        local.set 26
                        local.get 6
                        local.get 26
                        i32.add
                        local.set 27
                        local.get 27
                        local.get 23
                        i32.add
                        local.set 28
                        local.get 28
                        local.get 25
                        i64.store
                        local.get 22
                        i64.load
                        local.set 29
                        local.get 6
                        local.get 29
                        i64.store offset=8
                        i32.const 8
                        local.set 30
                        local.get 6
                        local.get 30
                        i32.add
                        local.set 31
                        local.get 31
                        call $timeval_to_time_us
                        local.set 32
                        local.get 6
                        local.get 32
                        i64.store offset=48
                        local.get 6
                        i32.load offset=72
                        local.set 33
                        local.get 6
                        i64.load offset=48
                        local.set 34
                        local.get 33
                        local.get 34
                        call $__wasi_sock_set_recv_timeout
                        local.set 35
                        local.get 6
                        local.get 35
                        i32.store16 offset=58
                        local.get 6
                        i32.load16_u offset=58
                        local.set 36
                        i32.const 65535
                        local.set 37
                        local.get 36
                        local.get 37
                        i32.and
                        local.set 38
                        block  ;; label = @11
                          local.get 38
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 6
                          i32.load16_u offset=58
                          local.set 39
                          i32.const 65535
                          local.set 40
                          local.get 39
                          local.get 40
                          i32.and
                          local.set 41
                          i32.const 0
                          local.set 42
                          local.get 42
                          local.get 41
                          i32.store offset=5284
                          i32.const -1
                          local.set 43
                          local.get 6
                          local.get 43
                          i32.store offset=76
                          br 10 (;@1;)
                        end
                        local.get 6
                        i32.load16_u offset=58
                        local.set 44
                        i32.const 65535
                        local.set 45
                        local.get 44
                        local.get 45
                        i32.and
                        local.set 46
                        local.get 6
                        local.get 46
                        i32.store offset=76
                        br 9 (;@1;)
                      end
                      local.get 6
                      i32.load offset=60
                      local.set 47
                      i32.const 16
                      local.set 48
                      local.get 47
                      local.set 49
                      local.get 48
                      local.set 50
                      local.get 49
                      local.get 50
                      i32.eq
                      local.set 51
                      i32.const 1
                      local.set 52
                      local.get 51
                      local.get 52
                      i32.and
                      local.set 53
                      block  ;; label = @10
                        local.get 53
                        br_if 0 (;@10;)
                        i32.const 1653
                        local.set 54
                        i32.const 1469
                        local.set 55
                        i32.const 781
                        local.set 56
                        i32.const 1125
                        local.set 57
                        local.get 54
                        local.get 55
                        local.get 56
                        local.get 57
                        call $__assert_fail
                        unreachable
                      end
                      local.get 6
                      i32.load offset=64
                      local.set 58
                      i32.const 8
                      local.set 59
                      local.get 58
                      local.get 59
                      i32.add
                      local.set 60
                      local.get 60
                      i64.load
                      local.set 61
                      i32.const 24
                      local.set 62
                      local.get 6
                      local.get 62
                      i32.add
                      local.set 63
                      local.get 63
                      local.get 59
                      i32.add
                      local.set 64
                      local.get 64
                      local.get 61
                      i64.store
                      local.get 58
                      i64.load
                      local.set 65
                      local.get 6
                      local.get 65
                      i64.store offset=24
                      i32.const 24
                      local.set 66
                      local.get 6
                      local.get 66
                      i32.add
                      local.set 67
                      local.get 67
                      call $timeval_to_time_us
                      local.set 68
                      local.get 6
                      local.get 68
                      i64.store offset=48
                      local.get 6
                      i32.load offset=72
                      local.set 69
                      local.get 6
                      i64.load offset=48
                      local.set 70
                      local.get 69
                      local.get 70
                      call $__wasi_sock_set_send_timeout
                      local.set 71
                      local.get 6
                      local.get 71
                      i32.store16 offset=58
                      local.get 6
                      i32.load16_u offset=58
                      local.set 72
                      i32.const 65535
                      local.set 73
                      local.get 72
                      local.get 73
                      i32.and
                      local.set 74
                      block  ;; label = @10
                        local.get 74
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 6
                        i32.load16_u offset=58
                        local.set 75
                        i32.const 65535
                        local.set 76
                        local.get 75
                        local.get 76
                        i32.and
                        local.set 77
                        i32.const 0
                        local.set 78
                        local.get 78
                        local.get 77
                        i32.store offset=5284
                        i32.const -1
                        local.set 79
                        local.get 6
                        local.get 79
                        i32.store offset=76
                        br 9 (;@1;)
                      end
                      local.get 6
                      i32.load16_u offset=58
                      local.set 80
                      i32.const 65535
                      local.set 81
                      local.get 80
                      local.get 81
                      i32.and
                      local.set 82
                      local.get 6
                      local.get 82
                      i32.store offset=76
                      br 8 (;@1;)
                    end
                    local.get 6
                    i32.load offset=60
                    local.set 83
                    i32.const 4
                    local.set 84
                    local.get 83
                    local.set 85
                    local.get 84
                    local.set 86
                    local.get 85
                    local.get 86
                    i32.eq
                    local.set 87
                    i32.const 1
                    local.set 88
                    local.get 87
                    local.get 88
                    i32.and
                    local.set 89
                    block  ;; label = @9
                      local.get 89
                      br_if 0 (;@9;)
                      i32.const 1497
                      local.set 90
                      i32.const 1469
                      local.set 91
                      i32.const 789
                      local.set 92
                      i32.const 1125
                      local.set 93
                      local.get 90
                      local.get 91
                      local.get 92
                      local.get 93
                      call $__assert_fail
                      unreachable
                    end
                    local.get 6
                    i32.load offset=72
                    local.set 94
                    local.get 6
                    i32.load offset=64
                    local.set 95
                    local.get 95
                    i32.load
                    local.set 96
                    local.get 94
                    local.get 96
                    call $__wasi_sock_set_send_buf_size
                    local.set 97
                    local.get 6
                    local.get 97
                    i32.store16 offset=58
                    local.get 6
                    i32.load16_u offset=58
                    local.set 98
                    i32.const 65535
                    local.set 99
                    local.get 98
                    local.get 99
                    i32.and
                    local.set 100
                    block  ;; label = @9
                      local.get 100
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 6
                      i32.load16_u offset=58
                      local.set 101
                      i32.const 65535
                      local.set 102
                      local.get 101
                      local.get 102
                      i32.and
                      local.set 103
                      i32.const 0
                      local.set 104
                      local.get 104
                      local.get 103
                      i32.store offset=5284
                      i32.const -1
                      local.set 105
                      local.get 6
                      local.get 105
                      i32.store offset=76
                      br 8 (;@1;)
                    end
                    local.get 6
                    i32.load16_u offset=58
                    local.set 106
                    i32.const 65535
                    local.set 107
                    local.get 106
                    local.get 107
                    i32.and
                    local.set 108
                    local.get 6
                    local.get 108
                    i32.store offset=76
                    br 7 (;@1;)
                  end
                  local.get 6
                  i32.load offset=60
                  local.set 109
                  i32.const 4
                  local.set 110
                  local.get 109
                  local.set 111
                  local.get 110
                  local.set 112
                  local.get 111
                  local.get 112
                  i32.eq
                  local.set 113
                  i32.const 1
                  local.set 114
                  local.get 113
                  local.get 114
                  i32.and
                  local.set 115
                  block  ;; label = @8
                    local.get 115
                    br_if 0 (;@8;)
                    i32.const 1497
                    local.set 116
                    i32.const 1469
                    local.set 117
                    i32.const 796
                    local.set 118
                    i32.const 1125
                    local.set 119
                    local.get 116
                    local.get 117
                    local.get 118
                    local.get 119
                    call $__assert_fail
                    unreachable
                  end
                  local.get 6
                  i32.load offset=72
                  local.set 120
                  local.get 6
                  i32.load offset=64
                  local.set 121
                  local.get 121
                  i32.load
                  local.set 122
                  local.get 120
                  local.get 122
                  call $__wasi_sock_set_recv_buf_size
                  local.set 123
                  local.get 6
                  local.get 123
                  i32.store16 offset=58
                  local.get 6
                  i32.load16_u offset=58
                  local.set 124
                  i32.const 65535
                  local.set 125
                  local.get 124
                  local.get 125
                  i32.and
                  local.set 126
                  block  ;; label = @8
                    local.get 126
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 6
                    i32.load16_u offset=58
                    local.set 127
                    i32.const 65535
                    local.set 128
                    local.get 127
                    local.get 128
                    i32.and
                    local.set 129
                    i32.const 0
                    local.set 130
                    local.get 130
                    local.get 129
                    i32.store offset=5284
                    i32.const -1
                    local.set 131
                    local.get 6
                    local.get 131
                    i32.store offset=76
                    br 7 (;@1;)
                  end
                  local.get 6
                  i32.load16_u offset=58
                  local.set 132
                  i32.const 65535
                  local.set 133
                  local.get 132
                  local.get 133
                  i32.and
                  local.set 134
                  local.get 6
                  local.get 134
                  i32.store offset=76
                  br 6 (;@1;)
                end
                local.get 6
                i32.load offset=60
                local.set 135
                i32.const 4
                local.set 136
                local.get 135
                local.set 137
                local.get 136
                local.set 138
                local.get 137
                local.get 138
                i32.eq
                local.set 139
                i32.const 1
                local.set 140
                local.get 139
                local.get 140
                i32.and
                local.set 141
                block  ;; label = @7
                  local.get 141
                  br_if 0 (;@7;)
                  i32.const 1497
                  local.set 142
                  i32.const 1469
                  local.set 143
                  i32.const 803
                  local.set 144
                  i32.const 1125
                  local.set 145
                  local.get 142
                  local.get 143
                  local.get 144
                  local.get 145
                  call $__assert_fail
                  unreachable
                end
                local.get 6
                i32.load offset=72
                local.set 146
                local.get 6
                i32.load offset=64
                local.set 147
                local.get 147
                i32.load8_u
                local.set 148
                i32.const 1
                local.set 149
                local.get 148
                local.get 149
                i32.and
                local.set 150
                local.get 146
                local.get 150
                call $__wasi_sock_set_keep_alive
                local.set 151
                local.get 6
                local.get 151
                i32.store16 offset=58
                local.get 6
                i32.load16_u offset=58
                local.set 152
                i32.const 65535
                local.set 153
                local.get 152
                local.get 153
                i32.and
                local.set 154
                block  ;; label = @7
                  local.get 154
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.load16_u offset=58
                  local.set 155
                  i32.const 65535
                  local.set 156
                  local.get 155
                  local.get 156
                  i32.and
                  local.set 157
                  i32.const 0
                  local.set 158
                  local.get 158
                  local.get 157
                  i32.store offset=5284
                  i32.const -1
                  local.set 159
                  local.get 6
                  local.get 159
                  i32.store offset=76
                  br 6 (;@1;)
                end
                local.get 6
                i32.load16_u offset=58
                local.set 160
                i32.const 65535
                local.set 161
                local.get 160
                local.get 161
                i32.and
                local.set 162
                local.get 6
                local.get 162
                i32.store offset=76
                br 5 (;@1;)
              end
              local.get 6
              i32.load offset=60
              local.set 163
              i32.const 4
              local.set 164
              local.get 163
              local.set 165
              local.get 164
              local.set 166
              local.get 165
              local.get 166
              i32.eq
              local.set 167
              i32.const 1
              local.set 168
              local.get 167
              local.get 168
              i32.and
              local.set 169
              block  ;; label = @6
                local.get 169
                br_if 0 (;@6;)
                i32.const 1497
                local.set 170
                i32.const 1469
                local.set 171
                i32.const 810
                local.set 172
                i32.const 1125
                local.set 173
                local.get 170
                local.get 171
                local.get 172
                local.get 173
                call $__assert_fail
                unreachable
              end
              local.get 6
              i32.load offset=72
              local.set 174
              local.get 6
              i32.load offset=64
              local.set 175
              local.get 175
              i32.load8_u
              local.set 176
              i32.const 1
              local.set 177
              local.get 176
              local.get 177
              i32.and
              local.set 178
              local.get 174
              local.get 178
              call $__wasi_sock_set_reuse_addr
              local.set 179
              local.get 6
              local.get 179
              i32.store16 offset=58
              local.get 6
              i32.load16_u offset=58
              local.set 180
              i32.const 65535
              local.set 181
              local.get 180
              local.get 181
              i32.and
              local.set 182
              block  ;; label = @6
                local.get 182
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load16_u offset=58
                local.set 183
                i32.const 65535
                local.set 184
                local.get 183
                local.get 184
                i32.and
                local.set 185
                i32.const 0
                local.set 186
                local.get 186
                local.get 185
                i32.store offset=5284
                i32.const -1
                local.set 187
                local.get 6
                local.get 187
                i32.store offset=76
                br 5 (;@1;)
              end
              local.get 6
              i32.load16_u offset=58
              local.set 188
              i32.const 65535
              local.set 189
              local.get 188
              local.get 189
              i32.and
              local.set 190
              local.get 6
              local.get 190
              i32.store offset=76
              br 4 (;@1;)
            end
            local.get 6
            i32.load offset=60
            local.set 191
            i32.const 4
            local.set 192
            local.get 191
            local.set 193
            local.get 192
            local.set 194
            local.get 193
            local.get 194
            i32.eq
            local.set 195
            i32.const 1
            local.set 196
            local.get 195
            local.get 196
            i32.and
            local.set 197
            block  ;; label = @5
              local.get 197
              br_if 0 (;@5;)
              i32.const 1497
              local.set 198
              i32.const 1469
              local.set 199
              i32.const 817
              local.set 200
              i32.const 1125
              local.set 201
              local.get 198
              local.get 199
              local.get 200
              local.get 201
              call $__assert_fail
              unreachable
            end
            local.get 6
            i32.load offset=72
            local.set 202
            local.get 6
            i32.load offset=64
            local.set 203
            local.get 203
            i32.load8_u
            local.set 204
            i32.const 1
            local.set 205
            local.get 204
            local.get 205
            i32.and
            local.set 206
            local.get 202
            local.get 206
            call $__wasi_sock_set_reuse_port
            local.set 207
            local.get 6
            local.get 207
            i32.store16 offset=58
            local.get 6
            i32.load16_u offset=58
            local.set 208
            i32.const 65535
            local.set 209
            local.get 208
            local.get 209
            i32.and
            local.set 210
            block  ;; label = @5
              local.get 210
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.load16_u offset=58
              local.set 211
              i32.const 65535
              local.set 212
              local.get 211
              local.get 212
              i32.and
              local.set 213
              i32.const 0
              local.set 214
              local.get 214
              local.get 213
              i32.store offset=5284
              i32.const -1
              local.set 215
              local.get 6
              local.get 215
              i32.store offset=76
              br 4 (;@1;)
            end
            local.get 6
            i32.load16_u offset=58
            local.set 216
            i32.const 65535
            local.set 217
            local.get 216
            local.get 217
            i32.and
            local.set 218
            local.get 6
            local.get 218
            i32.store offset=76
            br 3 (;@1;)
          end
          local.get 6
          i32.load offset=60
          local.set 219
          i32.const 8
          local.set 220
          local.get 219
          local.set 221
          local.get 220
          local.set 222
          local.get 221
          local.get 222
          i32.eq
          local.set 223
          i32.const 1
          local.set 224
          local.get 223
          local.get 224
          i32.and
          local.set 225
          block  ;; label = @4
            local.get 225
            br_if 0 (;@4;)
            i32.const 1546
            local.set 226
            i32.const 1469
            local.set 227
            i32.const 824
            local.set 228
            i32.const 1125
            local.set 229
            local.get 226
            local.get 227
            local.get 228
            local.get 229
            call $__assert_fail
            unreachable
          end
          local.get 6
          i32.load offset=64
          local.set 230
          local.get 6
          local.get 230
          i32.store offset=44
          local.get 6
          i32.load offset=72
          local.set 231
          local.get 6
          i32.load offset=44
          local.set 232
          local.get 232
          i32.load
          local.set 233
          i32.const 0
          local.set 234
          local.get 233
          local.set 235
          local.get 234
          local.set 236
          local.get 235
          local.get 236
          i32.ne
          local.set 237
          local.get 6
          i32.load offset=44
          local.set 238
          local.get 238
          i32.load offset=4
          local.set 239
          i32.const 1
          local.set 240
          local.get 237
          local.get 240
          i32.and
          local.set 241
          local.get 231
          local.get 241
          local.get 239
          call $__wasi_sock_set_linger
          local.set 242
          local.get 6
          local.get 242
          i32.store16 offset=58
          local.get 6
          i32.load16_u offset=58
          local.set 243
          i32.const 65535
          local.set 244
          local.get 243
          local.get 244
          i32.and
          local.set 245
          block  ;; label = @4
            local.get 245
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load16_u offset=58
            local.set 246
            i32.const 65535
            local.set 247
            local.get 246
            local.get 247
            i32.and
            local.set 248
            i32.const 0
            local.set 249
            local.get 249
            local.get 248
            i32.store offset=5284
            i32.const -1
            local.set 250
            local.get 6
            local.get 250
            i32.store offset=76
            br 3 (;@1;)
          end
          local.get 6
          i32.load16_u offset=58
          local.set 251
          i32.const 65535
          local.set 252
          local.get 251
          local.get 252
          i32.and
          local.set 253
          local.get 6
          local.get 253
          i32.store offset=76
          br 2 (;@1;)
        end
        local.get 6
        i32.load offset=60
        local.set 254
        i32.const 4
        local.set 255
        local.get 254
        local.set 256
        local.get 255
        local.set 257
        local.get 256
        local.get 257
        i32.eq
        local.set 258
        i32.const 1
        local.set 259
        local.get 258
        local.get 259
        i32.and
        local.set 260
        block  ;; label = @3
          local.get 260
          br_if 0 (;@3;)
          i32.const 1497
          local.set 261
          i32.const 1469
          local.set 262
          i32.const 833
          local.set 263
          i32.const 1125
          local.set 264
          local.get 261
          local.get 262
          local.get 263
          local.get 264
          call $__assert_fail
          unreachable
        end
        local.get 6
        i32.load offset=72
        local.set 265
        local.get 6
        i32.load offset=64
        local.set 266
        local.get 266
        i32.load8_u
        local.set 267
        i32.const 1
        local.set 268
        local.get 267
        local.get 268
        i32.and
        local.set 269
        local.get 265
        local.get 269
        call $__wasi_sock_set_broadcast
        local.set 270
        local.get 6
        local.get 270
        i32.store16 offset=58
        local.get 6
        i32.load16_u offset=58
        local.set 271
        i32.const 65535
        local.set 272
        local.get 271
        local.get 272
        i32.and
        local.set 273
        block  ;; label = @3
          local.get 273
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.load16_u offset=58
          local.set 274
          i32.const 65535
          local.set 275
          local.get 274
          local.get 275
          i32.and
          local.set 276
          i32.const 0
          local.set 277
          local.get 277
          local.get 276
          i32.store offset=5284
          i32.const -1
          local.set 278
          local.get 6
          local.get 278
          i32.store offset=76
          br 2 (;@1;)
        end
        local.get 6
        i32.load16_u offset=58
        local.set 279
        i32.const 65535
        local.set 280
        local.get 279
        local.get 280
        i32.and
        local.set 281
        local.get 6
        local.get 281
        i32.store offset=76
        br 1 (;@1;)
      end
      i32.const 58
      local.set 282
      local.get 6
      local.get 282
      i32.store16 offset=58
      local.get 6
      i32.load16_u offset=58
      local.set 283
      i32.const 65535
      local.set 284
      local.get 283
      local.get 284
      i32.and
      local.set 285
      block  ;; label = @2
        local.get 285
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.load16_u offset=58
        local.set 286
        i32.const 65535
        local.set 287
        local.get 286
        local.get 287
        i32.and
        local.set 288
        i32.const 0
        local.set 289
        local.get 289
        local.get 288
        i32.store offset=5284
        i32.const -1
        local.set 290
        local.get 6
        local.get 290
        i32.store offset=76
        br 1 (;@1;)
      end
      local.get 6
      i32.load16_u offset=58
      local.set 291
      i32.const 65535
      local.set 292
      local.get 291
      local.get 292
      i32.and
      local.set 293
      local.get 6
      local.get 293
      i32.store offset=76
    end
    local.get 6
    i32.load offset=76
    local.set 294
    i32.const 80
    local.set 295
    local.get 6
    local.get 295
    i32.add
    local.set 296
    local.get 296
    global.set $__stack_pointer
    local.get 294
    return)
  (func $set_ipproto_tcp_option (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 32
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=24
    local.get 6
    local.get 1
    i32.store offset=20
    local.get 6
    local.get 2
    i32.store offset=16
    local.get 6
    local.get 3
    i32.store offset=12
    local.get 6
    i32.load offset=20
    local.set 7
    i32.const -1
    local.set 8
    local.get 7
    local.get 8
    i32.add
    local.set 9
    i32.const 29
    local.set 10
    local.get 9
    local.get 10
    i32.gt_u
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 9
                  br_table 0 (;@7;) 5 (;@2;) 5 (;@2;) 1 (;@6;) 2 (;@5;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 4 (;@3;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 3 (;@4;) 5 (;@2;)
                end
                local.get 6
                i32.load offset=12
                local.set 11
                i32.const 4
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
                block  ;; label = @7
                  local.get 17
                  br_if 0 (;@7;)
                  i32.const 1497
                  local.set 18
                  i32.const 1469
                  local.set 19
                  i32.const 855
                  local.set 20
                  i32.const 1169
                  local.set 21
                  local.get 18
                  local.get 19
                  local.get 20
                  local.get 21
                  call $__assert_fail
                  unreachable
                end
                local.get 6
                i32.load offset=24
                local.set 22
                local.get 6
                i32.load offset=16
                local.set 23
                local.get 23
                i32.load8_u
                local.set 24
                i32.const 1
                local.set 25
                local.get 24
                local.get 25
                i32.and
                local.set 26
                local.get 22
                local.get 26
                call $__wasi_sock_set_tcp_no_delay
                local.set 27
                local.get 6
                local.get 27
                i32.store16 offset=10
                local.get 6
                i32.load16_u offset=10
                local.set 28
                i32.const 65535
                local.set 29
                local.get 28
                local.get 29
                i32.and
                local.set 30
                block  ;; label = @7
                  local.get 30
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.load16_u offset=10
                  local.set 31
                  i32.const 65535
                  local.set 32
                  local.get 31
                  local.get 32
                  i32.and
                  local.set 33
                  i32.const 0
                  local.set 34
                  local.get 34
                  local.get 33
                  i32.store offset=5284
                  i32.const -1
                  local.set 35
                  local.get 6
                  local.get 35
                  i32.store offset=28
                  br 6 (;@1;)
                end
                local.get 6
                i32.load16_u offset=10
                local.set 36
                i32.const 65535
                local.set 37
                local.get 36
                local.get 37
                i32.and
                local.set 38
                local.get 6
                local.get 38
                i32.store offset=28
                br 5 (;@1;)
              end
              local.get 6
              i32.load offset=12
              local.set 39
              i32.const 4
              local.set 40
              local.get 39
              local.set 41
              local.get 40
              local.set 42
              local.get 41
              local.get 42
              i32.eq
              local.set 43
              i32.const 1
              local.set 44
              local.get 43
              local.get 44
              i32.and
              local.set 45
              block  ;; label = @6
                local.get 45
                br_if 0 (;@6;)
                i32.const 1519
                local.set 46
                i32.const 1469
                local.set 47
                i32.const 860
                local.set 48
                i32.const 1169
                local.set 49
                local.get 46
                local.get 47
                local.get 48
                local.get 49
                call $__assert_fail
                unreachable
              end
              local.get 6
              i32.load offset=24
              local.set 50
              local.get 6
              i32.load offset=16
              local.set 51
              local.get 51
              i32.load
              local.set 52
              local.get 50
              local.get 52
              call $__wasi_sock_set_tcp_keep_idle
              local.set 53
              local.get 6
              local.get 53
              i32.store16 offset=10
              local.get 6
              i32.load16_u offset=10
              local.set 54
              i32.const 65535
              local.set 55
              local.get 54
              local.get 55
              i32.and
              local.set 56
              block  ;; label = @6
                local.get 56
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load16_u offset=10
                local.set 57
                i32.const 65535
                local.set 58
                local.get 57
                local.get 58
                i32.and
                local.set 59
                i32.const 0
                local.set 60
                local.get 60
                local.get 59
                i32.store offset=5284
                i32.const -1
                local.set 61
                local.get 6
                local.get 61
                i32.store offset=28
                br 5 (;@1;)
              end
              local.get 6
              i32.load16_u offset=10
              local.set 62
              i32.const 65535
              local.set 63
              local.get 62
              local.get 63
              i32.and
              local.set 64
              local.get 6
              local.get 64
              i32.store offset=28
              br 4 (;@1;)
            end
            local.get 6
            i32.load offset=12
            local.set 65
            i32.const 4
            local.set 66
            local.get 65
            local.set 67
            local.get 66
            local.set 68
            local.get 67
            local.get 68
            i32.eq
            local.set 69
            i32.const 1
            local.set 70
            local.get 69
            local.get 70
            i32.and
            local.set 71
            block  ;; label = @5
              local.get 71
              br_if 0 (;@5;)
              i32.const 1519
              local.set 72
              i32.const 1469
              local.set 73
              i32.const 865
              local.set 74
              i32.const 1169
              local.set 75
              local.get 72
              local.get 73
              local.get 74
              local.get 75
              call $__assert_fail
              unreachable
            end
            local.get 6
            i32.load offset=24
            local.set 76
            local.get 6
            i32.load offset=16
            local.set 77
            local.get 77
            i32.load
            local.set 78
            local.get 76
            local.get 78
            call $__wasi_sock_set_tcp_keep_intvl
            local.set 79
            local.get 6
            local.get 79
            i32.store16 offset=10
            local.get 6
            i32.load16_u offset=10
            local.set 80
            i32.const 65535
            local.set 81
            local.get 80
            local.get 81
            i32.and
            local.set 82
            block  ;; label = @5
              local.get 82
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.load16_u offset=10
              local.set 83
              i32.const 65535
              local.set 84
              local.get 83
              local.get 84
              i32.and
              local.set 85
              i32.const 0
              local.set 86
              local.get 86
              local.get 85
              i32.store offset=5284
              i32.const -1
              local.set 87
              local.get 6
              local.get 87
              i32.store offset=28
              br 4 (;@1;)
            end
            local.get 6
            i32.load16_u offset=10
            local.set 88
            i32.const 65535
            local.set 89
            local.get 88
            local.get 89
            i32.and
            local.set 90
            local.get 6
            local.get 90
            i32.store offset=28
            br 3 (;@1;)
          end
          local.get 6
          i32.load offset=12
          local.set 91
          i32.const 4
          local.set 92
          local.get 91
          local.set 93
          local.get 92
          local.set 94
          local.get 93
          local.get 94
          i32.eq
          local.set 95
          i32.const 1
          local.set 96
          local.get 95
          local.get 96
          i32.and
          local.set 97
          block  ;; label = @4
            local.get 97
            br_if 0 (;@4;)
            i32.const 1497
            local.set 98
            i32.const 1469
            local.set 99
            i32.const 870
            local.set 100
            i32.const 1169
            local.set 101
            local.get 98
            local.get 99
            local.get 100
            local.get 101
            call $__assert_fail
            unreachable
          end
          local.get 6
          i32.load offset=24
          local.set 102
          local.get 6
          i32.load offset=16
          local.set 103
          local.get 103
          i32.load8_u
          local.set 104
          i32.const 1
          local.set 105
          local.get 104
          local.get 105
          i32.and
          local.set 106
          local.get 102
          local.get 106
          call $__wasi_sock_set_tcp_fastopen_connect
          local.set 107
          local.get 6
          local.get 107
          i32.store16 offset=10
          local.get 6
          i32.load16_u offset=10
          local.set 108
          i32.const 65535
          local.set 109
          local.get 108
          local.get 109
          i32.and
          local.set 110
          block  ;; label = @4
            local.get 110
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load16_u offset=10
            local.set 111
            i32.const 65535
            local.set 112
            local.get 111
            local.get 112
            i32.and
            local.set 113
            i32.const 0
            local.set 114
            local.get 114
            local.get 113
            i32.store offset=5284
            i32.const -1
            local.set 115
            local.get 6
            local.get 115
            i32.store offset=28
            br 3 (;@1;)
          end
          local.get 6
          i32.load16_u offset=10
          local.set 116
          i32.const 65535
          local.set 117
          local.get 116
          local.get 117
          i32.and
          local.set 118
          local.get 6
          local.get 118
          i32.store offset=28
          br 2 (;@1;)
        end
        local.get 6
        i32.load offset=12
        local.set 119
        i32.const 4
        local.set 120
        local.get 119
        local.set 121
        local.get 120
        local.set 122
        local.get 121
        local.get 122
        i32.eq
        local.set 123
        i32.const 1
        local.set 124
        local.get 123
        local.get 124
        i32.and
        local.set 125
        block  ;; label = @3
          local.get 125
          br_if 0 (;@3;)
          i32.const 1497
          local.set 126
          i32.const 1469
          local.set 127
          i32.const 876
          local.set 128
          i32.const 1169
          local.set 129
          local.get 126
          local.get 127
          local.get 128
          local.get 129
          call $__assert_fail
          unreachable
        end
        local.get 6
        i32.load offset=24
        local.set 130
        local.get 6
        i32.load offset=16
        local.set 131
        local.get 131
        i32.load8_u
        local.set 132
        i32.const 1
        local.set 133
        local.get 132
        local.get 133
        i32.and
        local.set 134
        local.get 130
        local.get 134
        call $__wasi_sock_set_tcp_quick_ack
        local.set 135
        local.get 6
        local.get 135
        i32.store16 offset=10
        local.get 6
        i32.load16_u offset=10
        local.set 136
        i32.const 65535
        local.set 137
        local.get 136
        local.get 137
        i32.and
        local.set 138
        block  ;; label = @3
          local.get 138
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.load16_u offset=10
          local.set 139
          i32.const 65535
          local.set 140
          local.get 139
          local.get 140
          i32.and
          local.set 141
          i32.const 0
          local.set 142
          local.get 142
          local.get 141
          i32.store offset=5284
          i32.const -1
          local.set 143
          local.get 6
          local.get 143
          i32.store offset=28
          br 2 (;@1;)
        end
        local.get 6
        i32.load16_u offset=10
        local.set 144
        i32.const 65535
        local.set 145
        local.get 144
        local.get 145
        i32.and
        local.set 146
        local.get 6
        local.get 146
        i32.store offset=28
        br 1 (;@1;)
      end
      i32.const 58
      local.set 147
      local.get 6
      local.get 147
      i32.store16 offset=10
      local.get 6
      i32.load16_u offset=10
      local.set 148
      i32.const 65535
      local.set 149
      local.get 148
      local.get 149
      i32.and
      local.set 150
      block  ;; label = @2
        local.get 150
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.load16_u offset=10
        local.set 151
        i32.const 65535
        local.set 152
        local.get 151
        local.get 152
        i32.and
        local.set 153
        i32.const 0
        local.set 154
        local.get 154
        local.get 153
        i32.store offset=5284
        i32.const -1
        local.set 155
        local.get 6
        local.get 155
        i32.store offset=28
        br 1 (;@1;)
      end
      local.get 6
      i32.load16_u offset=10
      local.set 156
      i32.const 65535
      local.set 157
      local.get 156
      local.get 157
      i32.and
      local.set 158
      local.get 6
      local.get 158
      i32.store offset=28
    end
    local.get 6
    i32.load offset=28
    local.set 159
    i32.const 32
    local.set 160
    local.get 6
    local.get 160
    i32.add
    local.set 161
    local.get 161
    global.set $__stack_pointer
    local.get 159
    return)
  (func $set_ipproto_ip_option (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 64
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=56
    local.get 6
    local.get 1
    i32.store offset=52
    local.get 6
    local.get 2
    i32.store offset=48
    local.get 6
    local.get 3
    i32.store offset=44
    local.get 6
    i32.load offset=52
    local.set 7
    i32.const -2
    local.set 8
    local.get 7
    local.get 8
    i32.add
    local.set 9
    i32.const 34
    local.set 10
    local.get 9
    local.get 10
    i32.gt_u
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 9
                  br_table 3 (;@4;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 5 (;@2;) 4 (;@3;) 0 (;@7;) 1 (;@6;) 2 (;@5;) 5 (;@2;)
                end
                local.get 6
                i32.load offset=44
                local.set 11
                i32.const 4
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
                block  ;; label = @7
                  local.get 17
                  br_if 0 (;@7;)
                  i32.const 1497
                  local.set 18
                  i32.const 1469
                  local.set 19
                  i32.const 897
                  local.set 20
                  i32.const 1147
                  local.set 21
                  local.get 18
                  local.get 19
                  local.get 20
                  local.get 21
                  call $__assert_fail
                  unreachable
                end
                local.get 6
                i32.load offset=56
                local.set 22
                local.get 6
                i32.load offset=48
                local.set 23
                local.get 23
                i32.load8_u
                local.set 24
                i32.const 0
                local.set 25
                i32.const 1
                local.set 26
                local.get 25
                local.get 26
                i32.and
                local.set 27
                i32.const 1
                local.set 28
                local.get 24
                local.get 28
                i32.and
                local.set 29
                local.get 22
                local.get 27
                local.get 29
                call $__wasi_sock_set_ip_multicast_loop
                local.set 30
                local.get 6
                local.get 30
                i32.store16 offset=42
                local.get 6
                i32.load16_u offset=42
                local.set 31
                i32.const 65535
                local.set 32
                local.get 31
                local.get 32
                i32.and
                local.set 33
                block  ;; label = @7
                  local.get 33
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.load16_u offset=42
                  local.set 34
                  i32.const 65535
                  local.set 35
                  local.get 34
                  local.get 35
                  i32.and
                  local.set 36
                  i32.const 0
                  local.set 37
                  local.get 37
                  local.get 36
                  i32.store offset=5284
                  i32.const -1
                  local.set 38
                  local.get 6
                  local.get 38
                  i32.store offset=60
                  br 6 (;@1;)
                end
                local.get 6
                i32.load16_u offset=42
                local.set 39
                i32.const 65535
                local.set 40
                local.get 39
                local.get 40
                i32.and
                local.set 41
                local.get 6
                local.get 41
                i32.store offset=60
                br 5 (;@1;)
              end
              local.get 6
              i32.load offset=44
              local.set 42
              i32.const 8
              local.set 43
              local.get 42
              local.set 44
              local.get 43
              local.set 45
              local.get 44
              local.get 45
              i32.eq
              local.set 46
              i32.const 1
              local.set 47
              local.get 46
              local.get 47
              i32.and
              local.set 48
              block  ;; label = @6
                local.get 48
                br_if 0 (;@6;)
                i32.const 1578
                local.set 49
                i32.const 1469
                local.set 50
                i32.const 903
                local.set 51
                i32.const 1147
                local.set 52
                local.get 49
                local.get 50
                local.get 51
                local.get 52
                call $__assert_fail
                unreachable
              end
              local.get 6
              i32.load offset=48
              local.set 53
              local.get 6
              local.get 53
              i32.store offset=12
              i32.const 0
              local.set 54
              local.get 6
              local.get 54
              i32.store offset=16
              local.get 6
              i32.load offset=12
              local.set 55
              local.get 55
              i32.load
              local.set 56
              i32.const 16
              local.set 57
              local.get 6
              local.get 57
              i32.add
              local.set 58
              local.get 58
              local.set 59
              i32.const 4
              local.set 60
              local.get 59
              local.get 60
              i32.add
              local.set 61
              local.get 56
              local.get 61
              call $ipv4_addr_to_wasi_ip4_addr
              local.get 6
              i32.load offset=56
              local.set 62
              local.get 6
              i32.load offset=12
              local.set 63
              local.get 63
              i32.load offset=4
              local.set 64
              i32.const 16
              local.set 65
              local.get 6
              local.get 65
              i32.add
              local.set 66
              local.get 66
              local.set 67
              local.get 62
              local.get 67
              local.get 64
              call $__wasi_sock_set_ip_add_membership
              local.set 68
              local.get 6
              local.get 68
              i32.store16 offset=42
              local.get 6
              i32.load16_u offset=42
              local.set 69
              i32.const 65535
              local.set 70
              local.get 69
              local.get 70
              i32.and
              local.set 71
              block  ;; label = @6
                local.get 71
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load16_u offset=42
                local.set 72
                i32.const 65535
                local.set 73
                local.get 72
                local.get 73
                i32.and
                local.set 74
                i32.const 0
                local.set 75
                local.get 75
                local.get 74
                i32.store offset=5284
                i32.const -1
                local.set 76
                local.get 6
                local.get 76
                i32.store offset=60
                br 5 (;@1;)
              end
              local.get 6
              i32.load16_u offset=42
              local.set 77
              i32.const 65535
              local.set 78
              local.get 77
              local.get 78
              i32.and
              local.set 79
              local.get 6
              local.get 79
              i32.store offset=60
              br 4 (;@1;)
            end
            local.get 6
            i32.load offset=44
            local.set 80
            i32.const 8
            local.set 81
            local.get 80
            local.set 82
            local.get 81
            local.set 83
            local.get 82
            local.get 83
            i32.eq
            local.set 84
            i32.const 1
            local.set 85
            local.get 84
            local.get 85
            i32.and
            local.set 86
            block  ;; label = @5
              local.get 86
              br_if 0 (;@5;)
              i32.const 1578
              local.set 87
              i32.const 1469
              local.set 88
              i32.const 913
              local.set 89
              i32.const 1147
              local.set 90
              local.get 87
              local.get 88
              local.get 89
              local.get 90
              call $__assert_fail
              unreachable
            end
            local.get 6
            i32.load offset=48
            local.set 91
            local.get 6
            local.get 91
            i32.store offset=12
            i32.const 0
            local.set 92
            local.get 6
            local.get 92
            i32.store offset=16
            local.get 6
            i32.load offset=12
            local.set 93
            local.get 93
            i32.load
            local.set 94
            i32.const 16
            local.set 95
            local.get 6
            local.get 95
            i32.add
            local.set 96
            local.get 96
            local.set 97
            i32.const 4
            local.set 98
            local.get 97
            local.get 98
            i32.add
            local.set 99
            local.get 94
            local.get 99
            call $ipv4_addr_to_wasi_ip4_addr
            local.get 6
            i32.load offset=56
            local.set 100
            local.get 6
            i32.load offset=12
            local.set 101
            local.get 101
            i32.load offset=4
            local.set 102
            i32.const 16
            local.set 103
            local.get 6
            local.get 103
            i32.add
            local.set 104
            local.get 104
            local.set 105
            local.get 100
            local.get 105
            local.get 102
            call $__wasi_sock_set_ip_drop_membership
            local.set 106
            local.get 6
            local.get 106
            i32.store16 offset=42
            local.get 6
            i32.load16_u offset=42
            local.set 107
            i32.const 65535
            local.set 108
            local.get 107
            local.get 108
            i32.and
            local.set 109
            block  ;; label = @5
              local.get 109
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.load16_u offset=42
              local.set 110
              i32.const 65535
              local.set 111
              local.get 110
              local.get 111
              i32.and
              local.set 112
              i32.const 0
              local.set 113
              local.get 113
              local.get 112
              i32.store offset=5284
              i32.const -1
              local.set 114
              local.get 6
              local.get 114
              i32.store offset=60
              br 4 (;@1;)
            end
            local.get 6
            i32.load16_u offset=42
            local.set 115
            i32.const 65535
            local.set 116
            local.get 115
            local.get 116
            i32.and
            local.set 117
            local.get 6
            local.get 117
            i32.store offset=60
            br 3 (;@1;)
          end
          local.get 6
          i32.load offset=44
          local.set 118
          i32.const 4
          local.set 119
          local.get 118
          local.set 120
          local.get 119
          local.set 121
          local.get 120
          local.get 121
          i32.eq
          local.set 122
          i32.const 1
          local.set 123
          local.get 122
          local.get 123
          i32.and
          local.set 124
          block  ;; label = @4
            local.get 124
            br_if 0 (;@4;)
            i32.const 1497
            local.set 125
            i32.const 1469
            local.set 126
            i32.const 923
            local.set 127
            i32.const 1147
            local.set 128
            local.get 125
            local.get 126
            local.get 127
            local.get 128
            call $__assert_fail
            unreachable
          end
          local.get 6
          i32.load offset=56
          local.set 129
          local.get 6
          i32.load offset=48
          local.set 130
          local.get 130
          i32.load8_u
          local.set 131
          i32.const 255
          local.set 132
          local.get 131
          local.get 132
          i32.and
          local.set 133
          local.get 129
          local.get 133
          call $__wasi_sock_set_ip_ttl
          local.set 134
          local.get 6
          local.get 134
          i32.store16 offset=42
          local.get 6
          i32.load16_u offset=42
          local.set 135
          i32.const 65535
          local.set 136
          local.get 135
          local.get 136
          i32.and
          local.set 137
          block  ;; label = @4
            local.get 137
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load16_u offset=42
            local.set 138
            i32.const 65535
            local.set 139
            local.get 138
            local.get 139
            i32.and
            local.set 140
            i32.const 0
            local.set 141
            local.get 141
            local.get 140
            i32.store offset=5284
            i32.const -1
            local.set 142
            local.get 6
            local.get 142
            i32.store offset=60
            br 3 (;@1;)
          end
          local.get 6
          i32.load16_u offset=42
          local.set 143
          i32.const 65535
          local.set 144
          local.get 143
          local.get 144
          i32.and
          local.set 145
          local.get 6
          local.get 145
          i32.store offset=60
          br 2 (;@1;)
        end
        local.get 6
        i32.load offset=44
        local.set 146
        i32.const 4
        local.set 147
        local.get 146
        local.set 148
        local.get 147
        local.set 149
        local.get 148
        local.get 149
        i32.eq
        local.set 150
        i32.const 1
        local.set 151
        local.get 150
        local.get 151
        i32.and
        local.set 152
        block  ;; label = @3
          local.get 152
          br_if 0 (;@3;)
          i32.const 1497
          local.set 153
          i32.const 1469
          local.set 154
          i32.const 928
          local.set 155
          i32.const 1147
          local.set 156
          local.get 153
          local.get 154
          local.get 155
          local.get 156
          call $__assert_fail
          unreachable
        end
        local.get 6
        i32.load offset=56
        local.set 157
        local.get 6
        i32.load offset=48
        local.set 158
        local.get 158
        i32.load8_u
        local.set 159
        i32.const 255
        local.set 160
        local.get 159
        local.get 160
        i32.and
        local.set 161
        local.get 157
        local.get 161
        call $__wasi_sock_set_ip_multicast_ttl
        local.set 162
        local.get 6
        local.get 162
        i32.store16 offset=42
        local.get 6
        i32.load16_u offset=42
        local.set 163
        i32.const 65535
        local.set 164
        local.get 163
        local.get 164
        i32.and
        local.set 165
        block  ;; label = @3
          local.get 165
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.load16_u offset=42
          local.set 166
          i32.const 65535
          local.set 167
          local.get 166
          local.get 167
          i32.and
          local.set 168
          i32.const 0
          local.set 169
          local.get 169
          local.get 168
          i32.store offset=5284
          i32.const -1
          local.set 170
          local.get 6
          local.get 170
          i32.store offset=60
          br 2 (;@1;)
        end
        local.get 6
        i32.load16_u offset=42
        local.set 171
        i32.const 65535
        local.set 172
        local.get 171
        local.get 172
        i32.and
        local.set 173
        local.get 6
        local.get 173
        i32.store offset=60
        br 1 (;@1;)
      end
      i32.const 58
      local.set 174
      local.get 6
      local.get 174
      i32.store16 offset=42
      local.get 6
      i32.load16_u offset=42
      local.set 175
      i32.const 65535
      local.set 176
      local.get 175
      local.get 176
      i32.and
      local.set 177
      block  ;; label = @2
        local.get 177
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.load16_u offset=42
        local.set 178
        i32.const 65535
        local.set 179
        local.get 178
        local.get 179
        i32.and
        local.set 180
        i32.const 0
        local.set 181
        local.get 181
        local.get 180
        i32.store offset=5284
        i32.const -1
        local.set 182
        local.get 6
        local.get 182
        i32.store offset=60
        br 1 (;@1;)
      end
      local.get 6
      i32.load16_u offset=42
      local.set 183
      i32.const 65535
      local.set 184
      local.get 183
      local.get 184
      i32.and
      local.set 185
      local.get 6
      local.get 185
      i32.store offset=60
    end
    local.get 6
    i32.load offset=60
    local.set 186
    i32.const 64
    local.set 187
    local.get 6
    local.get 187
    i32.add
    local.set 188
    local.get 188
    global.set $__stack_pointer
    local.get 186
    return)
  (func $set_ipproto_ipv6_option (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 48
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 0
    i32.store offset=40
    local.get 6
    local.get 1
    i32.store offset=36
    local.get 6
    local.get 2
    i32.store offset=32
    local.get 6
    local.get 3
    i32.store offset=28
    local.get 6
    i32.load offset=36
    local.set 7
    i32.const -19
    local.set 8
    local.get 7
    local.get 8
    i32.add
    local.set 9
    i32.const 7
    local.set 10
    local.get 9
    local.get 10
    i32.gt_u
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 9
                br_table 1 (;@5;) 2 (;@4;) 3 (;@3;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 0 (;@6;) 4 (;@2;)
              end
              local.get 6
              i32.load offset=28
              local.set 11
              i32.const 4
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
              block  ;; label = @6
                local.get 17
                br_if 0 (;@6;)
                i32.const 1497
                local.set 18
                i32.const 1469
                local.set 19
                i32.const 950
                local.set 20
                i32.const 1192
                local.set 21
                local.get 18
                local.get 19
                local.get 20
                local.get 21
                call $__assert_fail
                unreachable
              end
              local.get 6
              i32.load offset=40
              local.set 22
              local.get 6
              i32.load offset=32
              local.set 23
              local.get 23
              i32.load8_u
              local.set 24
              i32.const 1
              local.set 25
              local.get 24
              local.get 25
              i32.and
              local.set 26
              local.get 22
              local.get 26
              call $__wasi_sock_set_ipv6_only
              local.set 27
              local.get 6
              local.get 27
              i32.store16 offset=26
              local.get 6
              i32.load16_u offset=26
              local.set 28
              i32.const 65535
              local.set 29
              local.get 28
              local.get 29
              i32.and
              local.set 30
              block  ;; label = @6
                local.get 30
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load16_u offset=26
                local.set 31
                i32.const 65535
                local.set 32
                local.get 31
                local.get 32
                i32.and
                local.set 33
                i32.const 0
                local.set 34
                local.get 34
                local.get 33
                i32.store offset=5284
                i32.const -1
                local.set 35
                local.get 6
                local.get 35
                i32.store offset=44
                br 5 (;@1;)
              end
              local.get 6
              i32.load16_u offset=26
              local.set 36
              i32.const 65535
              local.set 37
              local.get 36
              local.get 37
              i32.and
              local.set 38
              local.get 6
              local.get 38
              i32.store offset=44
              br 4 (;@1;)
            end
            local.get 6
            i32.load offset=28
            local.set 39
            i32.const 4
            local.set 40
            local.get 39
            local.set 41
            local.get 40
            local.set 42
            local.get 41
            local.get 42
            i32.eq
            local.set 43
            i32.const 1
            local.set 44
            local.get 43
            local.get 44
            i32.and
            local.set 45
            block  ;; label = @5
              local.get 45
              br_if 0 (;@5;)
              i32.const 1497
              local.set 46
              i32.const 1469
              local.set 47
              i32.const 955
              local.set 48
              i32.const 1192
              local.set 49
              local.get 46
              local.get 47
              local.get 48
              local.get 49
              call $__assert_fail
              unreachable
            end
            local.get 6
            i32.load offset=40
            local.set 50
            local.get 6
            i32.load offset=32
            local.set 51
            local.get 51
            i32.load8_u
            local.set 52
            i32.const 1
            local.set 53
            i32.const 1
            local.set 54
            local.get 53
            local.get 54
            i32.and
            local.set 55
            i32.const 1
            local.set 56
            local.get 52
            local.get 56
            i32.and
            local.set 57
            local.get 50
            local.get 55
            local.get 57
            call $__wasi_sock_set_ip_multicast_loop
            local.set 58
            local.get 6
            local.get 58
            i32.store16 offset=26
            local.get 6
            i32.load16_u offset=26
            local.set 59
            i32.const 65535
            local.set 60
            local.get 59
            local.get 60
            i32.and
            local.set 61
            block  ;; label = @5
              local.get 61
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.load16_u offset=26
              local.set 62
              i32.const 65535
              local.set 63
              local.get 62
              local.get 63
              i32.and
              local.set 64
              i32.const 0
              local.set 65
              local.get 65
              local.get 64
              i32.store offset=5284
              i32.const -1
              local.set 66
              local.get 6
              local.get 66
              i32.store offset=44
              br 4 (;@1;)
            end
            local.get 6
            i32.load16_u offset=26
            local.set 67
            i32.const 65535
            local.set 68
            local.get 67
            local.get 68
            i32.and
            local.set 69
            local.get 6
            local.get 69
            i32.store offset=44
            br 3 (;@1;)
          end
          local.get 6
          i32.load offset=28
          local.set 70
          i32.const 20
          local.set 71
          local.get 70
          local.set 72
          local.get 71
          local.set 73
          local.get 72
          local.get 73
          i32.eq
          local.set 74
          i32.const 1
          local.set 75
          local.get 74
          local.get 75
          i32.and
          local.set 76
          block  ;; label = @4
            local.get 76
            br_if 0 (;@4;)
            i32.const 1611
            local.set 77
            i32.const 1469
            local.set 78
            i32.const 961
            local.set 79
            i32.const 1192
            local.set 80
            local.get 77
            local.get 78
            local.get 79
            local.get 80
            call $__assert_fail
            unreachable
          end
          local.get 6
          i32.load offset=32
          local.set 81
          local.get 6
          local.get 81
          i32.store offset=20
          i32.const 1
          local.set 82
          local.get 6
          local.get 82
          i32.store
          local.get 6
          i32.load offset=20
          local.set 83
          local.get 6
          local.set 84
          i32.const 4
          local.set 85
          local.get 84
          local.get 85
          i32.add
          local.set 86
          local.get 83
          local.get 86
          call $ipv6_addr_to_wasi_ipv6_addr
          local.get 6
          i32.load offset=40
          local.set 87
          local.get 6
          i32.load offset=20
          local.set 88
          local.get 88
          i32.load offset=16
          local.set 89
          local.get 6
          local.set 90
          local.get 87
          local.get 90
          local.get 89
          call $__wasi_sock_set_ip_add_membership
          local.set 91
          local.get 6
          local.get 91
          i32.store16 offset=26
          local.get 6
          i32.load16_u offset=26
          local.set 92
          i32.const 65535
          local.set 93
          local.get 92
          local.get 93
          i32.and
          local.set 94
          block  ;; label = @4
            local.get 94
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load16_u offset=26
            local.set 95
            i32.const 65535
            local.set 96
            local.get 95
            local.get 96
            i32.and
            local.set 97
            i32.const 0
            local.set 98
            local.get 98
            local.get 97
            i32.store offset=5284
            i32.const -1
            local.set 99
            local.get 6
            local.get 99
            i32.store offset=44
            br 3 (;@1;)
          end
          local.get 6
          i32.load16_u offset=26
          local.set 100
          i32.const 65535
          local.set 101
          local.get 100
          local.get 101
          i32.and
          local.set 102
          local.get 6
          local.get 102
          i32.store offset=44
          br 2 (;@1;)
        end
        local.get 6
        i32.load offset=28
        local.set 103
        i32.const 20
        local.set 104
        local.get 103
        local.set 105
        local.get 104
        local.set 106
        local.get 105
        local.get 106
        i32.eq
        local.set 107
        i32.const 1
        local.set 108
        local.get 107
        local.get 108
        i32.and
        local.set 109
        block  ;; label = @3
          local.get 109
          br_if 0 (;@3;)
          i32.const 1611
          local.set 110
          i32.const 1469
          local.set 111
          i32.const 972
          local.set 112
          i32.const 1192
          local.set 113
          local.get 110
          local.get 111
          local.get 112
          local.get 113
          call $__assert_fail
          unreachable
        end
        local.get 6
        i32.load offset=32
        local.set 114
        local.get 6
        local.get 114
        i32.store offset=20
        i32.const 1
        local.set 115
        local.get 6
        local.get 115
        i32.store
        local.get 6
        i32.load offset=20
        local.set 116
        local.get 6
        local.set 117
        i32.const 4
        local.set 118
        local.get 117
        local.get 118
        i32.add
        local.set 119
        local.get 116
        local.get 119
        call $ipv6_addr_to_wasi_ipv6_addr
        local.get 6
        i32.load offset=40
        local.set 120
        local.get 6
        i32.load offset=20
        local.set 121
        local.get 121
        i32.load offset=16
        local.set 122
        local.get 6
        local.set 123
        local.get 120
        local.get 123
        local.get 122
        call $__wasi_sock_set_ip_drop_membership
        local.set 124
        local.get 6
        local.get 124
        i32.store16 offset=26
        local.get 6
        i32.load16_u offset=26
        local.set 125
        i32.const 65535
        local.set 126
        local.get 125
        local.get 126
        i32.and
        local.set 127
        block  ;; label = @3
          local.get 127
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.load16_u offset=26
          local.set 128
          i32.const 65535
          local.set 129
          local.get 128
          local.get 129
          i32.and
          local.set 130
          i32.const 0
          local.set 131
          local.get 131
          local.get 130
          i32.store offset=5284
          i32.const -1
          local.set 132
          local.get 6
          local.get 132
          i32.store offset=44
          br 2 (;@1;)
        end
        local.get 6
        i32.load16_u offset=26
        local.set 133
        i32.const 65535
        local.set 134
        local.get 133
        local.get 134
        i32.and
        local.set 135
        local.get 6
        local.get 135
        i32.store offset=44
        br 1 (;@1;)
      end
      i32.const 58
      local.set 136
      local.get 6
      local.get 136
      i32.store16 offset=26
      local.get 6
      i32.load16_u offset=26
      local.set 137
      i32.const 65535
      local.set 138
      local.get 137
      local.get 138
      i32.and
      local.set 139
      block  ;; label = @2
        local.get 139
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.load16_u offset=26
        local.set 140
        i32.const 65535
        local.set 141
        local.get 140
        local.get 141
        i32.and
        local.set 142
        i32.const 0
        local.set 143
        local.get 143
        local.get 142
        i32.store offset=5284
        i32.const -1
        local.set 144
        local.get 6
        local.get 144
        i32.store offset=44
        br 1 (;@1;)
      end
      local.get 6
      i32.load16_u offset=26
      local.set 145
      i32.const 65535
      local.set 146
      local.get 145
      local.get 146
      i32.and
      local.set 147
      local.get 6
      local.get 147
      i32.store offset=44
    end
    local.get 6
    i32.load offset=44
    local.set 148
    i32.const 48
    local.set 149
    local.get 6
    local.get 149
    i32.add
    local.set 150
    local.get 150
    global.set $__stack_pointer
    local.get 148
    return)
  (func $timeval_to_time_us (type 12) (param i32) (result i64)
    (local i64 i64 i64 i64 i64)
    local.get 0
    i64.load
    local.set 1
    i64.const 1000000
    local.set 2
    local.get 1
    local.get 2
    i64.mul
    local.set 3
    local.get 0
    i64.load offset=8
    local.set 4
    local.get 3
    local.get 4
    i64.add
    local.set 5
    local.get 5
    return)
  (func $__wasi_sock_set_recv_timeout (type 4) (param i32 i64) (result i32)
    (local i32 i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i64.store
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i64.load
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_set_recv_timeout
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $__wasi_sock_set_send_timeout (type 4) (param i32 i64) (result i32)
    (local i32 i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i64.store
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i64.load
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_set_send_timeout
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $__wasi_sock_set_send_buf_size (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_set_send_buf_size
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $__wasi_sock_set_recv_buf_size (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_set_recv_buf_size
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $__wasi_sock_set_keep_alive (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_keep_alive
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_reuse_addr (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_reuse_addr
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_reuse_port (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_reuse_port
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_linger (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 6
    local.get 5
    local.get 6
    i32.store8 offset=11
    local.get 5
    local.get 2
    i32.store offset=4
    local.get 5
    i32.load offset=12
    local.set 7
    local.get 5
    i32.load8_u offset=11
    local.set 8
    i32.const 1
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    local.get 5
    i32.load offset=4
    local.set 11
    local.get 7
    local.get 10
    local.get 11
    call $__imported_wasi_snapshot_preview1_sock_set_linger
    local.set 12
    i32.const 65535
    local.set 13
    local.get 12
    local.get 13
    i32.and
    local.set 14
    i32.const 16
    local.set 15
    local.get 5
    local.get 15
    i32.add
    local.set 16
    local.get 16
    global.set $__stack_pointer
    local.get 14
    return)
  (func $__wasi_sock_set_broadcast (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_broadcast
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_tcp_no_delay (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_tcp_no_delay
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_tcp_keep_idle (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_set_tcp_keep_idle
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $__wasi_sock_set_tcp_keep_intvl (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load offset=8
    local.set 6
    local.get 5
    local.get 6
    call $__imported_wasi_snapshot_preview1_sock_set_tcp_keep_intvl
    local.set 7
    i32.const 65535
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $__wasi_sock_set_tcp_fastopen_connect (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_tcp_fastopen_connect
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_tcp_quick_ack (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_tcp_quick_ack
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $__wasi_sock_set_ip_multicast_loop (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 6
    local.get 5
    local.get 6
    i32.store8 offset=11
    local.get 2
    local.set 7
    local.get 5
    local.get 7
    i32.store8 offset=10
    local.get 5
    i32.load offset=12
    local.set 8
    local.get 5
    i32.load8_u offset=11
    local.set 9
    i32.const 1
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    local.get 5
    i32.load8_u offset=10
    local.set 12
    i32.const 1
    local.set 13
    local.get 12
    local.get 13
    i32.and
    local.set 14
    local.get 8
    local.get 11
    local.get 14
    call $__imported_wasi_snapshot_preview1_sock_set_ip_multicast_loop
    local.set 15
    i32.const 65535
    local.set 16
    local.get 15
    local.get 16
    i32.and
    local.set 17
    i32.const 16
    local.set 18
    local.get 5
    local.get 18
    i32.add
    local.set 19
    local.get 19
    global.set $__stack_pointer
    local.get 17
    return)
  (func $ipv4_addr_to_wasi_ip4_addr (type 13) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 5
    call $ntohl
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=12
    local.get 4
    i32.load offset=12
    local.set 7
    i32.const -16777216
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 24
    local.set 10
    local.get 9
    local.get 10
    i32.shr_u
    local.set 11
    local.get 4
    i32.load offset=8
    local.set 12
    local.get 12
    local.get 11
    i32.store8
    local.get 4
    i32.load offset=12
    local.set 13
    i32.const 16711680
    local.set 14
    local.get 13
    local.get 14
    i32.and
    local.set 15
    i32.const 16
    local.set 16
    local.get 15
    local.get 16
    i32.shr_u
    local.set 17
    local.get 4
    i32.load offset=8
    local.set 18
    local.get 18
    local.get 17
    i32.store8 offset=1
    local.get 4
    i32.load offset=12
    local.set 19
    i32.const 65280
    local.set 20
    local.get 19
    local.get 20
    i32.and
    local.set 21
    i32.const 8
    local.set 22
    local.get 21
    local.get 22
    i32.shr_u
    local.set 23
    local.get 4
    i32.load offset=8
    local.set 24
    local.get 24
    local.get 23
    i32.store8 offset=2
    local.get 4
    i32.load offset=12
    local.set 25
    i32.const 255
    local.set 26
    local.get 25
    local.get 26
    i32.and
    local.set 27
    local.get 4
    i32.load offset=8
    local.set 28
    local.get 28
    local.get 27
    i32.store8 offset=3
    i32.const 16
    local.set 29
    local.get 4
    local.get 29
    i32.add
    local.set 30
    local.get 30
    global.set $__stack_pointer
    return)
  (func $__wasi_sock_set_ip_add_membership (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=4
    local.get 5
    i32.load offset=12
    local.set 6
    local.get 5
    i32.load offset=8
    local.set 7
    local.get 5
    i32.load offset=4
    local.set 8
    local.get 6
    local.get 7
    local.get 8
    call $__imported_wasi_snapshot_preview1_sock_set_ip_add_membership
    local.set 9
    i32.const 65535
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    i32.const 16
    local.set 12
    local.get 5
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    local.get 11
    return)
  (func $__wasi_sock_set_ip_drop_membership (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=4
    local.get 5
    i32.load offset=12
    local.set 6
    local.get 5
    i32.load offset=8
    local.set 7
    local.get 5
    i32.load offset=4
    local.set 8
    local.get 6
    local.get 7
    local.get 8
    call $__imported_wasi_snapshot_preview1_sock_set_ip_drop_membership
    local.set 9
    i32.const 65535
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    i32.const 16
    local.set 12
    local.get 5
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    local.get 11
    return)
  (func $__wasi_sock_set_ip_ttl (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load8_u offset=11
    local.set 6
    i32.const 255
    local.set 7
    local.get 6
    local.get 7
    i32.and
    local.set 8
    local.get 5
    local.get 8
    call $__imported_wasi_snapshot_preview1_sock_set_ip_ttl
    local.set 9
    i32.const 65535
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    i32.const 16
    local.set 12
    local.get 4
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    local.get 11
    return)
  (func $__wasi_sock_set_ip_multicast_ttl (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 4
    i32.load8_u offset=11
    local.set 6
    i32.const 255
    local.set 7
    local.get 6
    local.get 7
    i32.and
    local.set 8
    local.get 5
    local.get 8
    call $__imported_wasi_snapshot_preview1_sock_set_ip_multicast_ttl
    local.set 9
    i32.const 65535
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    i32.const 16
    local.set 12
    local.get 4
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set $__stack_pointer
    local.get 11
    return)
  (func $__wasi_sock_set_ipv6_only (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=11
    local.get 4
    i32.load offset=12
    local.set 6
    local.get 4
    i32.load8_u offset=11
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    local.get 6
    local.get 9
    call $__imported_wasi_snapshot_preview1_sock_set_ipv6_only
    local.set 10
    i32.const 65535
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $ipv6_addr_to_wasi_ipv6_addr (type 13) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    i32.load offset=12
    local.set 5
    local.get 5
    i32.load16_u
    local.set 6
    i32.const 65535
    local.set 7
    local.get 6
    local.get 7
    i32.and
    local.set 8
    local.get 8
    call $ntohs
    local.set 9
    local.get 4
    i32.load offset=8
    local.set 10
    local.get 10
    local.get 9
    i32.store16
    local.get 4
    i32.load offset=12
    local.set 11
    local.get 11
    i32.load16_u offset=2
    local.set 12
    i32.const 65535
    local.set 13
    local.get 12
    local.get 13
    i32.and
    local.set 14
    local.get 14
    call $ntohs
    local.set 15
    local.get 4
    i32.load offset=8
    local.set 16
    local.get 16
    local.get 15
    i32.store16 offset=2
    local.get 4
    i32.load offset=12
    local.set 17
    local.get 17
    i32.load16_u offset=4
    local.set 18
    i32.const 65535
    local.set 19
    local.get 18
    local.get 19
    i32.and
    local.set 20
    local.get 20
    call $ntohs
    local.set 21
    local.get 4
    i32.load offset=8
    local.set 22
    local.get 22
    local.get 21
    i32.store16 offset=4
    local.get 4
    i32.load offset=12
    local.set 23
    local.get 23
    i32.load16_u offset=6
    local.set 24
    i32.const 65535
    local.set 25
    local.get 24
    local.get 25
    i32.and
    local.set 26
    local.get 26
    call $ntohs
    local.set 27
    local.get 4
    i32.load offset=8
    local.set 28
    local.get 28
    local.get 27
    i32.store16 offset=6
    local.get 4
    i32.load offset=12
    local.set 29
    local.get 29
    i32.load16_u offset=8
    local.set 30
    i32.const 65535
    local.set 31
    local.get 30
    local.get 31
    i32.and
    local.set 32
    local.get 32
    call $ntohs
    local.set 33
    local.get 4
    i32.load offset=8
    local.set 34
    local.get 34
    local.get 33
    i32.store16 offset=8
    local.get 4
    i32.load offset=12
    local.set 35
    local.get 35
    i32.load16_u offset=10
    local.set 36
    i32.const 65535
    local.set 37
    local.get 36
    local.get 37
    i32.and
    local.set 38
    local.get 38
    call $ntohs
    local.set 39
    local.get 4
    i32.load offset=8
    local.set 40
    local.get 40
    local.get 39
    i32.store16 offset=10
    local.get 4
    i32.load offset=12
    local.set 41
    local.get 41
    i32.load16_u offset=12
    local.set 42
    i32.const 65535
    local.set 43
    local.get 42
    local.get 43
    i32.and
    local.set 44
    local.get 44
    call $ntohs
    local.set 45
    local.get 4
    i32.load offset=8
    local.set 46
    local.get 46
    local.get 45
    i32.store16 offset=12
    local.get 4
    i32.load offset=12
    local.set 47
    local.get 47
    i32.load16_u offset=14
    local.set 48
    i32.const 65535
    local.set 49
    local.get 48
    local.get 49
    i32.and
    local.set 50
    local.get 50
    call $ntohs
    local.set 51
    local.get 4
    i32.load offset=8
    local.set 52
    local.get 52
    local.get 51
    i32.store16 offset=14
    i32.const 16
    local.set 53
    local.get 4
    local.get 53
    i32.add
    local.set 54
    local.get 54
    global.set $__stack_pointer
    return)
  (func $malloc (type 5) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load offset=4812
      br_if 0 (;@1;)
      i32.const 0
      call $sbrk
      i32.const 71904
      i32.sub
      local.tee 2
      i32.const 89
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 3
      block  ;; label = @2
        i32.const 0
        i32.load offset=5260
        local.tee 4
        br_if 0 (;@2;)
        i32.const 0
        i64.const -1
        i64.store offset=5272 align=4
        i32.const 0
        i64.const 281474976776192
        i64.store offset=5264 align=4
        i32.const 0
        local.get 1
        i32.const 8
        i32.add
        i32.const -16
        i32.and
        i32.const 1431655768
        i32.xor
        local.tee 4
        i32.store offset=5260
        i32.const 0
        i32.const 0
        i32.store offset=5280
        i32.const 0
        i32.const 0
        i32.store offset=5232
      end
      i32.const 0
      local.get 2
      i32.store offset=5240
      i32.const 0
      i32.const 71904
      i32.store offset=5236
      i32.const 0
      i32.const 71904
      i32.store offset=4804
      i32.const 0
      local.get 4
      i32.store offset=4824
      i32.const 0
      i32.const -1
      i32.store offset=4820
      loop  ;; label = @2
        local.get 3
        i32.const 4848
        i32.add
        local.get 3
        i32.const 4836
        i32.add
        local.tee 4
        i32.store
        local.get 4
        local.get 3
        i32.const 4828
        i32.add
        local.tee 5
        i32.store
        local.get 3
        i32.const 4840
        i32.add
        local.get 5
        i32.store
        local.get 3
        i32.const 4856
        i32.add
        local.get 3
        i32.const 4844
        i32.add
        local.tee 5
        i32.store
        local.get 5
        local.get 4
        i32.store
        local.get 3
        i32.const 4864
        i32.add
        local.get 3
        i32.const 4852
        i32.add
        local.tee 4
        i32.store
        local.get 4
        local.get 5
        i32.store
        local.get 3
        i32.const 4860
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
      i32.const 71904
      i32.const -8
      i32.const 71904
      i32.sub
      i32.const 15
      i32.and
      i32.const 0
      i32.const 71904
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
      i32.load offset=5276
      i32.store offset=4816
      i32.const 0
      local.get 3
      i32.store offset=4800
      i32.const 0
      local.get 4
      i32.store offset=4812
      i32.const 71904
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
                              i32.load offset=4788
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
                              i32.const 4836
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
                                  i32.const 4828
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
                                  i32.store offset=4788
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
                            i32.load offset=4796
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
                                  i32.const 4836
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  i32.load offset=8
                                  local.tee 3
                                  local.get 0
                                  i32.const 4828
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
                                  i32.store offset=4788
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
                                i32.const 4828
                                i32.add
                                local.set 2
                                i32.const 0
                                i32.load offset=4808
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
                                    i32.store offset=4788
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
                              i32.store offset=4808
                              i32.const 0
                              local.get 5
                              i32.store offset=4796
                              br 12 (;@1;)
                            end
                            i32.const 0
                            i32.load offset=4792
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
                            i32.const 5092
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
                              i32.load offset=4804
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
                          i32.load offset=4792
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
                                  i32.const 5092
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
                                i32.const 5092
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
                          i32.load offset=4796
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
                            i32.load offset=4804
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
                          i32.load offset=4796
                          local.tee 3
                          local.get 2
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=4808
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
                              i32.store offset=4796
                              i32.const 0
                              local.get 0
                              i32.store offset=4808
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
                            i32.store offset=4808
                            i32.const 0
                            i32.const 0
                            i32.store offset=4796
                          end
                          local.get 4
                          i32.const 8
                          i32.add
                          local.set 3
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4800
                          local.tee 0
                          local.get 2
                          i32.le_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=4812
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
                          i32.store offset=4800
                          i32.const 0
                          local.get 4
                          i32.store offset=4812
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
                            i32.load offset=5260
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=5268
                            local.set 4
                            br 1 (;@11;)
                          end
                          i32.const 0
                          i64.const -1
                          i64.store offset=5272 align=4
                          i32.const 0
                          i64.const 281474976776192
                          i64.store offset=5264 align=4
                          i32.const 0
                          local.get 1
                          i32.const 12
                          i32.add
                          i32.const -16
                          i32.and
                          i32.const 1431655768
                          i32.xor
                          i32.store offset=5260
                          i32.const 0
                          i32.const 0
                          i32.store offset=5280
                          i32.const 0
                          i32.const 0
                          i32.store offset=5232
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
                          i32.store offset=5284
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=5228
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=5220
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
                          i32.store offset=5284
                          br 10 (;@1;)
                        end
                        i32.const 0
                        i32.load8_u offset=5232
                        i32.const 4
                        i32.and
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4812
                              local.tee 4
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 5236
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
                              i32.load offset=5264
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
                              i32.load offset=5228
                              local.tee 3
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=5220
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
                            i32.load offset=5268
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
                i32.load offset=5232
                i32.const 4
                i32.or
                i32.store offset=5232
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
            i32.load offset=5220
            local.get 6
            i32.add
            local.tee 3
            i32.store offset=5220
            block  ;; label = @5
              local.get 3
              i32.const 0
              i32.load offset=5224
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 3
              i32.store offset=5224
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=4812
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 5236
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
                      i32.load offset=4804
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
                    i32.store offset=4804
                  end
                  i32.const 0
                  local.set 3
                  i32.const 0
                  local.get 6
                  i32.store offset=5240
                  i32.const 0
                  local.get 0
                  i32.store offset=5236
                  i32.const 0
                  i32.const -1
                  i32.store offset=4820
                  i32.const 0
                  i32.const 0
                  i32.load offset=5260
                  i32.store offset=4824
                  i32.const 0
                  i32.const 0
                  i32.store offset=5248
                  loop  ;; label = @8
                    local.get 3
                    i32.const 4848
                    i32.add
                    local.get 3
                    i32.const 4836
                    i32.add
                    local.tee 4
                    i32.store
                    local.get 4
                    local.get 3
                    i32.const 4828
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 3
                    i32.const 4840
                    i32.add
                    local.get 5
                    i32.store
                    local.get 3
                    i32.const 4856
                    i32.add
                    local.get 3
                    i32.const 4844
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    local.get 4
                    i32.store
                    local.get 3
                    i32.const 4864
                    i32.add
                    local.get 3
                    i32.const 4852
                    i32.add
                    local.tee 4
                    i32.store
                    local.get 4
                    local.get 5
                    i32.store
                    local.get 3
                    i32.const 4860
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
                  i32.load offset=5276
                  i32.store offset=4816
                  i32.const 0
                  local.get 3
                  i32.store offset=4800
                  i32.const 0
                  local.get 4
                  i32.store offset=4812
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
                i32.load offset=4800
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
                i32.load offset=5276
                i32.store offset=4816
                i32.const 0
                local.get 5
                i32.store offset=4800
                i32.const 0
                local.get 0
                i32.store offset=4812
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
                i32.load offset=4804
                local.tee 8
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                i32.store offset=4804
                local.get 0
                local.set 8
              end
              local.get 0
              local.get 6
              i32.add
              local.set 5
              i32.const 5236
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
                        i32.const 5236
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
                        i32.store offset=4812
                        i32.const 0
                        i32.const 0
                        i32.load offset=4800
                        local.get 5
                        i32.add
                        local.tee 3
                        i32.store offset=4800
                        local.get 2
                        local.get 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4808
                        local.get 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 2
                        i32.store offset=4808
                        i32.const 0
                        i32.const 0
                        i32.load offset=4796
                        local.get 5
                        i32.add
                        local.tee 3
                        i32.store offset=4796
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
                            i32.const 4828
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
                              i32.load offset=4788
                              i32.const -2
                              local.get 8
                              i32.rotl
                              i32.and
                              i32.store offset=4788
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
                              i32.const 5092
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
                              i32.load offset=4792
                              i32.const -2
                              local.get 4
                              i32.rotl
                              i32.and
                              i32.store offset=4792
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
                        i32.const 4828
                        i32.add
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=4788
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
                            i32.store offset=4788
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
                      i32.const 5092
                      i32.add
                      local.set 4
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4792
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
                        i32.store offset=4792
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
                    i32.load offset=5276
                    i32.store offset=4816
                    i32.const 0
                    local.get 3
                    i32.store offset=4800
                    i32.const 0
                    local.get 11
                    i32.store offset=4812
                    local.get 8
                    i32.const 16
                    i32.add
                    i32.const 0
                    i64.load offset=5244 align=4
                    i64.store align=4
                    local.get 8
                    i32.const 0
                    i64.load offset=5236 align=4
                    i64.store offset=8 align=4
                    i32.const 0
                    local.get 8
                    i32.const 8
                    i32.add
                    i32.store offset=5244
                    i32.const 0
                    local.get 6
                    i32.store offset=5240
                    i32.const 0
                    local.get 0
                    i32.store offset=5236
                    i32.const 0
                    i32.const 0
                    i32.store offset=5248
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
                      i32.const 4828
                      i32.add
                      local.set 3
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4788
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
                          i32.store offset=4788
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
                    i32.const 5092
                    i32.add
                    local.set 5
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=4792
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
                      i32.store offset=4792
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
            i32.load offset=4800
            local.tee 3
            local.get 2
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=4812
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
            i32.store offset=4800
            i32.const 0
            local.get 5
            i32.store offset=4812
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
          i32.store offset=5284
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
              i32.const 5092
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
              i32.store offset=4792
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
            i32.const 4828
            i32.add
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=4788
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
                i32.store offset=4788
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
          i32.const 5092
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
            i32.store offset=4792
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
            i32.const 5092
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
            i32.store offset=4792
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
          i32.const 4828
          i32.add
          local.set 2
          i32.const 0
          i32.load offset=4808
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
              i32.store offset=4788
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
        i32.store offset=4808
        i32.const 0
        local.get 4
        i32.store offset=4796
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
  (func $free (type 7) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 7) (param i32)
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
        i32.load offset=4804
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          i32.const 0
          i32.load offset=4808
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
            i32.const 4828
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
              i32.load offset=4788
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=4788
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
              i32.const 5092
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
              i32.load offset=4792
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=4792
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
        i32.store offset=4796
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
            i32.load offset=4812
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=4812
            i32.const 0
            i32.const 0
            i32.load offset=4800
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=4800
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.load offset=4808
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=4796
            i32.const 0
            i32.const 0
            i32.store offset=4808
            return
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=4808
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=4808
            i32.const 0
            i32.const 0
            i32.load offset=4796
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=4796
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
              i32.const 4828
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
                i32.load offset=4788
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=4788
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
                i32.load offset=4804
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
                i32.const 5092
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
                i32.load offset=4792
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=4792
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
          i32.load offset=4808
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=4796
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
        i32.const 4828
        i32.add
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=4788
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
            i32.store offset=4788
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
      i32.const 5092
      i32.add
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=4792
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
          i32.store offset=4792
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
      i32.load offset=4820
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=4820
    end)
  (func $calloc (type 2) (param i32 i32) (result i32)
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
  (func $close (type 5) (param i32) (result i32)
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
    i32.store offset=5284
    i32.const -1)
  (func $recv (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 0
        i32.const 58
        i32.store offset=5284
        i32.const -1
        local.set 3
        br 1 (;@1;)
      end
      local.get 4
      local.get 2
      i32.store offset=12
      local.get 4
      local.get 1
      i32.store offset=8
      block  ;; label = @2
        local.get 0
        local.get 4
        i32.const 8
        i32.add
        i32.const 1
        local.get 3
        i32.const 65535
        i32.and
        local.get 4
        i32.const 4
        i32.add
        local.get 4
        i32.const 2
        i32.add
        call $__wasi_sock_recv
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 3
        i32.store offset=5284
        i32.const -1
        local.set 3
        br 1 (;@1;)
      end
      local.get 4
      i32.load offset=4
      local.set 3
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $shutdown (type 2) (param i32 i32) (result i32)
    (local i32)
    i32.const 28
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const -4
      i32.add
      i32.const -3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 255
      i32.and
      call $__wasi_sock_shutdown
      local.tee 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 2
    i32.store offset=5284
    i32.const -1)
  (func $send (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 58
        i32.store offset=5284
        i32.const -1
        local.set 3
        br 1 (;@1;)
      end
      local.get 4
      local.get 2
      i32.store offset=12
      local.get 4
      local.get 1
      i32.store offset=8
      block  ;; label = @2
        local.get 0
        local.get 4
        i32.const 8
        i32.add
        i32.const 1
        i32.const 0
        local.get 4
        i32.const 4
        i32.add
        call $__wasi_sock_send
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 3
        i32.store offset=5284
        i32.const -1
        local.set 3
        br 1 (;@1;)
      end
      local.get 4
      i32.load offset=4
      local.set 3
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $sbrk (type 5) (param i32) (result i32)
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
        i32.store offset=5284
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
  (func $_Exit (type 7) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
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
  (func $abort (type 10)
    unreachable
    unreachable)
  (func $__wasi_args_get (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_get
    i32.const 65535
    i32.and)
  (func $__wasi_args_sizes_get (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_sizes_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_close (type 5) (param i32) (result i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_fd_close
    i32.const 65535
    i32.and)
  (func $__wasi_fd_fdstat_get (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_fdstat_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_seek (type 6) (param i32 i64 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_seek
    i32.const 65535
    i32.and)
  (func $__wasi_fd_write (type 3) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_write
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 7) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $__wasi_sock_accept (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $__imported_wasi_snapshot_preview1_sock_accept
    i32.const 65535
    i32.and)
  (func $__wasi_sock_recv (type 8) (param i32 i32 i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 5
    call $__imported_wasi_snapshot_preview1_sock_recv
    i32.const 65535
    i32.and)
  (func $__wasi_sock_send (type 9) (param i32 i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call $__imported_wasi_snapshot_preview1_sock_send
    i32.const 65535
    i32.and)
  (func $__wasi_sock_shutdown (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_sock_shutdown
    i32.const 65535
    i32.and)
  (func $htonl (type 5) (param i32) (result i32)
    local.get 0
    i32.const 24
    i32.shl
    local.get 0
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or)
  (func $htons (type 5) (param i32) (result i32)
    local.get 0
    i32.const 8
    i32.shl
    local.get 0
    i32.const 8
    i32.shr_u
    i32.or
    i32.const 65535
    i32.and)
  (func $ntohl (type 5) (param i32) (result i32)
    local.get 0
    i32.const 24
    i32.shl
    local.get 0
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or)
  (func $ntohs (type 5) (param i32) (result i32)
    local.get 0
    i32.const 8
    i32.shl
    local.get 0
    i32.const 8
    i32.shr_u
    i32.or
    i32.const 65535
    i32.and)
  (func $dummy (type 10))
  (func $__wasm_call_dtors (type 10)
    call $dummy
    call $__stdio_exit)
  (func $exit (type 7) (param i32)
    call $dummy
    call $__stdio_exit
    local.get 0
    call $_Exit
    unreachable)
  (func $__assert_fail (type 15) (param i32 i32 i32 i32)
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
    i32.const 4536
    i32.const 2174
    local.get 4
    call $fprintf
    drop
    call $abort
    unreachable)
  (func $writev (type 0) (param i32 i32 i32) (result i32)
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
        i32.store offset=5284
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
        i32.store offset=5284
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
  (func $__stdio_write (type 0) (param i32 i32 i32) (result i32)
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
  (func $__stdio_close (type 5) (param i32) (result i32)
    local.get 0
    i32.load offset=56
    call $close)
  (func $printf (type 2) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 4656
    local.get 0
    local.get 1
    call $vfprintf
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $strerror (type 5) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=6352
      local.tee 1
      br_if 0 (;@1;)
      i32.const 6328
      local.set 1
      i32.const 0
      i32.const 6328
      i32.store offset=6352
    end
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i32.const 1
    i32.shl
    i32.const 3888
    i32.add
    i32.load16_u
    i32.const 2324
    i32.add
    local.get 1
    i32.load offset=20
    call $__lctrans)
  (func $__stdio_exit (type 10)
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
          call_indirect (type 0)
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
      i32.load offset=6356
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
        call_indirect (type 0)
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
      i32.load offset=4768
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
        call_indirect (type 0)
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
      i32.load offset=4648
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
        call_indirect (type 0)
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
  (func $__towrite (type 5) (param i32) (result i32)
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
  (func $__fwritex (type 0) (param i32 i32 i32) (result i32)
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
        call_indirect (type 0)
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
        call_indirect (type 0)
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
  (func $fwrite (type 3) (param i32 i32 i32 i32) (result i32)
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
        call_indirect (type 0)
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
        call_indirect (type 0)
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
  (func $perror (type 7) (param i32)
    (local i32 i32 i32)
    i32.const 0
    i32.load offset=5284
    call $strerror
    local.set 1
    i32.const 0
    i32.load offset=4596
    local.set 2
    i32.const 0
    i32.load offset=4640
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      call $strlen
      i32.const 1
      i32.const 4536
      call $fwrite
      drop
      i32.const 58
      i32.const 4536
      call $fputc
      drop
      i32.const 32
      i32.const 4536
      call $fputc
      drop
    end
    local.get 1
    local.get 1
    call $strlen
    i32.const 1
    i32.const 4536
    call $fwrite
    drop
    i32.const 10
    i32.const 4536
    call $fputc
    drop
    i32.const 0
    local.get 3
    i32.store offset=4640
    i32.const 0
    local.get 2
    i32.store offset=4596)
  (func $__ofl_lock (type 14) (result i32)
    i32.const 6360)
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
        i32.store offset=5284
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
  (func $fprintf (type 0) (param i32 i32 i32) (result i32)
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
  (func $fputs (type 2) (param i32 i32) (result i32)
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
  (func $vfprintf (type 0) (param i32 i32 i32) (result i32)
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
        call_indirect (type 0)
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
                    i32.const 3983
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
                                                  i32.const 4512
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
                                    i32.load offset=5284
                                    call $strerror
                                    local.set 21
                                    br 1 (;@15;)
                                  end
                                  local.get 5
                                  i32.load offset=56
                                  local.tee 20
                                  i32.const 1646
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
                          i32.const 1293
                          i32.const 1487
                          local.get 31
                          i32.const 32
                          i32.and
                          local.tee 20
                          select
                          i32.const 1297
                          i32.const 1491
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
                            i32.const 1495
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
                              i32.const 1495
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
                i32.store offset=5284
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
                i32.const 4512
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
        i32.store offset=5284
      end
      i32.const -1
      local.set 19
    end
    local.get 5
    i32.const 880
    i32.add
    global.set $__stack_pointer
    local.get 19)
  (func $pop_arg (type 11) (param i32 i32 i32)
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
  (func $pad (type 16) (param i32 i32 i32 i32 i32)
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
  (func $long_double_not_supported (type 10)
    i32.const 1973
    i32.const 4536
    call $fputs
    drop
    call $abort
    unreachable)
  (func $__overflow (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store8 offset=15
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const -1
        local.set 3
        local.get 0
        call $__towrite
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=16
        local.set 3
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.tee 4
        local.get 3
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=64
        local.get 1
        i32.const 255
        i32.and
        local.tee 3
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 4
        local.get 1
        i32.store8
        br 1 (;@1;)
      end
      i32.const -1
      local.set 3
      local.get 0
      local.get 2
      i32.const 15
      i32.add
      i32.const 1
      local.get 0
      i32.load offset=32
      call_indirect (type 0)
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.load8_u offset=15
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $fputc (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 255
      i32.and
      local.tee 2
      local.get 1
      i32.load offset=64
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=20
      local.tee 3
      local.get 1
      i32.load offset=16
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 3
      i32.const 1
      i32.add
      i32.store offset=20
      local.get 3
      local.get 0
      i32.store8
      local.get 2
      return
    end
    local.get 1
    local.get 2
    call $__overflow)
  (func $__isatty (type 5) (param i32) (result i32)
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
      i32.store offset=5284
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $__stdout_write (type 0) (param i32 i32 i32) (result i32)
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
  (func $strnlen (type 2) (param i32 i32) (result i32)
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
  (func $strcmp (type 2) (param i32 i32) (result i32)
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
  (func $memcpy (type 0) (param i32 i32 i32) (result i32)
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
  (func $memset (type 0) (param i32 i32 i32) (result i32)
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
  (func $strlen (type 5) (param i32) (result i32)
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
  (func $memchr (type 0) (param i32 i32 i32) (result i32)
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
  (func $dummy.1 (type 2) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.1)
  (func $wctomb (type 2) (param i32 i32) (result i32)
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
  (func $wcrtomb (type 0) (param i32 i32 i32) (result i32)
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
          i32.load offset=6328
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
            i32.store offset=5284
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
        i32.store offset=5284
      end
      i32.const -1
      local.set 3
    end
    local.get 3)
  (func $tolower (type 5) (param i32) (result i32)
    local.get 0
    i32.const 32
    i32.or
    local.get 0
    local.get 0
    i32.const -65
    i32.add
    i32.const 26
    i32.lt_u
    select)
  (func $frexp (type 17) (param f64 i32) (result f64)
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
  (func $_start.command_export (type 10)
    call $_start
    call $__wasm_call_dtors)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 71904))
  (export "memory" (memory 0))
  (export "_start" (func $_start.command_export))
  (elem (;0;) (i32.const 1) func $__stdio_close $__stdio_write $__stdio_seek $__stdout_write)
  (data $.rodata (i32.const 1024) "-+   0X0x\00-0X+0X 0X-0x+0x 0x\00client\00Hello from Client\00server\00sockaddr_to_wasi_addr\00Server says Hello\00set_sol_socket_option\00set_ipproto_ip_option\00set_ipproto_tcp_option\00set_ipproto_ipv6_option\00sizeof(struct sockaddr_in) <= addrlen\00sizeof(struct sockaddr_in6) <= addrlen\00nan\00inf\00Create socket failed\00Client Connect failed\00Set socket options failed\00Server accept connection failed\00Server listen failed\00Receive failed\00Server bind failed\00Send failed\00wasi_socket_ext.c\00NAN\00INF\00.\00optlen == sizeof(int)\00optlen == sizeof(uint32_t)\00optlen == sizeof(struct linger)\00optlen == sizeof(struct ip_mreq)\00optlen == sizeof(struct ipv6_mreq)\00(null)\00optlen == sizeof(struct timeval)\00Server Listen socket\0a\00Create socket\0a\00Server Bind socket\0a\00Set socket options\0a\00Receiving test message\0a\00Sending test message\0a\00Specify \22client\22 or \22server\22; any other value not accepted\0a\00Connected\0a\00Sent %d bytes of test data OK\0a\00Received %d bytes of test data OK\0a\00usage: %s <client|server>\0a\00Support for formatting long double values is currently disabled.\0aTo enable it, add -lc-printscan-long-double to the link command.\0a\00Client Connect to Server...\0a\00Server waiting for client connection...\0a\00Assertion failed: %s (%s: %s: %d)\0a\00Received message: \22%s\22\0a\00Test succeeds!\0a\00Peer disconnected!\0a\00Client connected!\0a\00Finished!\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\b8\11\00\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05\00\00\00\00\00\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF")
  (data $.data (i32.const 4528) "$\04\00\00S\04\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\03\00\00\00\b0\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\b8\11\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\03\00\00\00\b8\14\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\12\00\00"))
