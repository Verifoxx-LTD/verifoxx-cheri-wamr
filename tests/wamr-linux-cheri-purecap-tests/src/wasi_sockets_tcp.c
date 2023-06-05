/** 
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

// Standalone TCP/IP sockets (client + server) test for WASI-libC using Berkeley Sockets POSIX functions
 
/* Notes on building:
 * 1. This requires wasi_socket_ext.h and wasi_socket_ext.c from WAMR's lib-socket library
 * 2. Recommend build with CMake and include needed files, or reference the two above files
 * 3. Simple build with clang, assuming all files are in the same folder:
 *
 * clang --target=wasm32-unknown-wasi -I. -o wasi_sockets_tcp.o -c wasi_sockets_tcp.c && \
 * clang --target=wasm32-unknown-wasi -I. -o wasi_socket_ext.o -c wasi_socket_ext.c && \
 * clang --target=wasm32-unknown-wasi -o wasi_sockets_tcp.wasm wasi_sockets_tcp.o wasi_socket_ext.o
 */

/*
 * Notes on using with WAMR:
 * 1. WAMR will restrict IP address pools.  The server listens on the default host address, port 1234.
 * 2. Client connects to loopback address, 127.0.0.1 on port 1234.
 *
 * For the address pool for WAMR, for server you can use:
 * --addr-pool=0.0.0.0/24
 * and for client:
 * --addr-pool=127.0.0.1/32
 */

#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#ifdef __wasi__
#include <wasi_socket_ext.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>


#define TCP_PORT    1234

char* client_test = "Hello from Client";
char* server_test = "Server says Hello";
char* test_message = NULL;

static bool do_send_test(int sock_fd)
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
    return true;
}

static bool do_receive_test(int sock_fd)
{
    int recvbytes;
    char buf[BUFSIZ];

    printf("Receiving test message\n");
    if (0 > (recvbytes = recv(sock_fd, buf, BUFSIZ, 0)))
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
        buf[recvbytes] = '\0';
        printf("Received message: \"%s\"\n", buf);
    }

    return true;
}


int main(int argc, char* argv[])
{
    int socket_fd, connected_socket_fd, ret, total_size = 0;
    char buffer[1024] = { 0 };
    char ip_string[64] = { 0 };
    socklen_t len;
    struct sockaddr_in addr = { 0 };
    char buf[BUFSIZ] = { 0 };
    char *dest = buf;
    char* src;
    bool client = false;
    int opt = 1;    // Set value

    if (argc != 2) {
        fprintf(stderr, "usage: %s <client|server>\n", argv[0]);
        return EXIT_FAILURE;
    }

    for(src = argv[1]; *src; ++src, ++dest)
    {
        *dest = tolower(*src);
    }

    test_message = server_test;
    if (strcmp(buf, "client") == 0)
    {
        client = true;
        test_message = client_test;
    }
    else if (strcmp(buf, "server") != 0)
    {
        fprintf(stderr, "Specify \"client\" or \"server\"; any other value not accepted\n");
        return EXIT_FAILURE;
    }

    printf("Create socket\n");
    if (0 > (socket_fd = socket(AF_INET, SOCK_STREAM, 0)))
    {
        perror("Create socket failed");
        return EXIT_FAILURE;
    }

    printf("Set socket options\n");
    if (0 > setsockopt(socket_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt)))
    {
        perror("Set socket options failed");
        return EXIT_FAILURE;
    }
    
    addr.sin_family = AF_INET;
    addr.sin_port = htons(TCP_PORT);

    if (client)
    {
        addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
        printf("Client Connect to Server...\n");

        if (0 > connect(socket_fd, (struct sockaddr*)&addr, sizeof(addr)))
        {
            perror("Client Connect failed");
            close(socket_fd);
            return EXIT_FAILURE;
        }

        printf("Connected\n");
        connected_socket_fd = socket_fd;

        if (!do_send_test(connected_socket_fd) || !do_receive_test(connected_socket_fd))
        {
            return EXIT_FAILURE;
        }
    }
    else
    {
        addr.sin_addr.s_addr = htonl(INADDR_ANY);
        printf("Server Bind socket\n");

        if (0 > bind(socket_fd, (struct sockaddr*)&addr, sizeof(addr)))
        {
            perror("Server bind failed");
            close(socket_fd);
            return EXIT_FAILURE;
        }

        printf("Server Listen socket\n");
        if (0 > listen(socket_fd, 1))
        {
            perror("Server listen failed");
            close(socket_fd);
            return EXIT_FAILURE;
        }

        printf("Server waiting for client connection...\n");
        int addrlen = sizeof(addr);
        if (0 > (connected_socket_fd = accept(socket_fd, (struct sockaddr*)&addr, (socklen_t*)&addrlen)))
        {
            perror("Server accept connection failed");
            close(socket_fd);
            return EXIT_FAILURE;
        }

        printf("Client connected!\n");
        if (!do_receive_test(connected_socket_fd) || !do_send_test(connected_socket_fd))
        {
            shutdown(socket_fd, SHUT_RDWR);
            return EXIT_FAILURE;
        }
    }

    printf("Test succeeds!\n");
    close(connected_socket_fd);

    if (!client)
    {
        shutdown(socket_fd, SHUT_RDWR);
    }

    printf("Finished!\n");
    return EXIT_SUCCESS;
}
