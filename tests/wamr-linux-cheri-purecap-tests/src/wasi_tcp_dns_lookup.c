/** 
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

// Standalone TCP/IP socket client webpage access + domain resolution test for WASI-libC using Berkeley Sockets POSIX functions
 
/* Notes on building:
 * 1. This requires wasi_socket_ext.h and wasi_socket_ext.c from WAMR's lib-socket library
 * 2. Recommend build with CMake and include needed files, or reference the two above files
 * 3. Simple build with clang, assuming all files are in the same folder:
 *
 * clang --target=wasm32-unknown-wasi -I. -o wasi_tcp_dns_lookup.o -c wasi_tcp_dns_lookup.c && \
 * clang --target=wasm32-unknown-wasi -I. -o wasi_socket_ext.o -c wasi_socket_ext.c && \
 * clang --target=wasm32-unknown-wasi -o wasi_tcp_dns_lookup.wasm wasi_socket_ext.o wasi_tcp_dns_lookup.o
 */

/*
 * Notes on using with WAMR:
 * - WAMR will restrict IP address pools.  WAMR will restrict domain name resolution.
 * - To resolve any domain and connect to any host:
 *          --addr-pool=0.0.0.0/0 --allow-resolve=*
 */

#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#ifdef __wasi__
#include <wasi_socket_ext.h>
#else
#include <netdb.h>
#endif

#define HTTP_PORT 80

static bool lookup_host(const char* host, struct sockaddr_in *p_addr)
{
    struct addrinfo hints = { 0 };
    struct addrinfo* res;
    char addr_out[BUFSIZ];
    const char* p_buf;

    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;

    if (0 != getaddrinfo(host, NULL, &hints, &res))
    {
        perror("Host lookup fails");
        return false;
    }

    printf("Host lookup succeeds\n");
    *p_addr = *((struct sockaddr_in*)res->ai_addr);

    if (!(p_buf = inet_ntop(res->ai_family, &p_addr->sin_addr, addr_out, sizeof(addr_out))))
    {
        perror("Failed convert to IP address");
        return false;
    }

    printf("Host: %s -> IP Addr: %s\n", host, p_buf);

    return true;
}

static bool do_send(int sock_fd, const char *test_message)
{
    int sentbytes;

    printf("Sending test message\n");
    if (0 > (sentbytes = send(sock_fd, test_message, strlen(test_message), 0)))
    {
        perror("Send failed");
        close(sock_fd);
        return false;
    }
    printf("Sent %d bytes of test data OK\n", sentbytes);
    printf("Sent \"%s\"\n", test_message);
    return true;
}

static bool do_receive(int sock_fd, char *rx_buf, int rx_buf_len)
{
    int recvbytes;

    printf("Receiving test message\n");
    if (0 > (recvbytes = recv(sock_fd, rx_buf, rx_buf_len-1, 0)))
    {
        perror("Receive failed");
        close(sock_fd);
        return false;
    }
    else if (0 == recvbytes)
    {
        printf("Peer disconnected!\n");
        close(sock_fd);
        return false;
    }
    else
    {
        printf("Received %d bytes of test data OK\n", recvbytes);
        rx_buf[recvbytes] = '\0';
    }

    return true;
}

int main(int argc, char* argv[])
{
    struct sockaddr_in addr;
    char recv_buff[4096];
    int socket_fd;
    int opt = 1;

    if (argc < 2)
    {
        printf("Usage: %s <domain_name>\n", argv[0]);
        return EXIT_FAILURE;
    }

    if (!lookup_host(argv[1], &addr))
    {
        printf("Lookup host failed!\n");
        return EXIT_FAILURE;
    }

    if (0 > (socket_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)))
    {
        perror("Create socket failed");
        return EXIT_FAILURE;
    }

    if (0 > setsockopt(socket_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt)) 
        || 0 > setsockopt(socket_fd, IPPROTO_TCP, TCP_NODELAY, &opt, sizeof(opt)))
    {
        perror("Set socket options failed");
        return EXIT_FAILURE;
    }

    addr.sin_port = htons(HTTP_PORT);
    addr.sin_family = AF_INET;
    if (0 > connect(socket_fd, (struct sockaddr*)&addr, sizeof(addr)))
    {
        perror("Client Connect failed");
        close(socket_fd);
        return EXIT_FAILURE;
    }

    printf("Connected\n");

    if (!do_send(socket_fd, "GET /\r\n") || !do_receive(socket_fd, recv_buff, sizeof(recv_buff)))
    {
        perror("Test FAILED");
        return EXIT_FAILURE;
    }

    printf("Received page:\n%s\n", recv_buff);

    printf("Test succeeds!\n");
    close(socket_fd);

    printf("Finished!\n");
    return EXIT_SUCCESS;
}
