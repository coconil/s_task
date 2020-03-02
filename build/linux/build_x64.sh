#!/bin/bash


ST_SOURCE=(
    ../../src/s_task.c
    ../../src/s_rbtree.c
    ../../src/s_list.c
)


ASM_SOURCE=(
    ../../asm/make_x86_64_sysv_elf_gas.S
    ../../asm/jump_x86_64_sysv_elf_gas.S
)


UV_SOURCE=(
    ../../libuv/src/fs-poll.c
    ../../libuv/src/idna.c
    ../../libuv/src/inet.c
    ../../libuv/src/strscpy.c
    ../../libuv/src/threadpool.c
    ../../libuv/src/timer.c
    ../../libuv/src/uv-common.c
    ../../libuv/src/uv-data-getter-setters.c
    ../../libuv/src/version.c
    ../../libuv/src/unix/async.c
    ../../libuv/src/unix/core.c
    ../../libuv/src/unix/dl.c
    ../../libuv/src/unix/fs.c
    ../../libuv/src/unix/getaddrinfo.c
    ../../libuv/src/unix/getnameinfo.c
    ../../libuv/src/unix/loop-watcher.c
    ../../libuv/src/unix/loop.c
    ../../libuv/src/unix/pipe.c
    ../../libuv/src/unix/poll.c
    ../../libuv/src/unix/process.c
    ../../libuv/src/unix/signal.c
    ../../libuv/src/unix/stream.c
    ../../libuv/src/unix/tcp.c
    ../../libuv/src/unix/thread.c
    ../../libuv/src/unix/tty.c
    ../../libuv/src/unix/udp.c
    ../../libuv/src/unix/proctitle.c
    ../../libuv/src/unix/linux-core.c
    ../../libuv/src/unix/linux-inotify.c
    ../../libuv/src/unix/linux-syscalls.c
    ../../libuv/src/unix/procfs-exepath.c
    ../../libuv/src/unix/sysinfo-loadavg.c
)


gcc -m64 -O2 -s -I../../include -Wall "${ST_SOURCE[@]}" "${ASM_SOURCE[@]}" ../../examples/ex0_task.c -o ex0_task 

gcc -m64 -O2 -s -I../../include -Wall "${ST_SOURCE[@]}" "${ASM_SOURCE[@]}" ../../examples/ex1_event.c -o ex1_event

gcc -m64 -O2 -s -I../../include -I../../libuv/include -I../../libuv/src -Wall\
     -DUSE_LIBUV -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -D_POSIX_C_SOURCE=200112 \
    "${ST_SOURCE[@]}" "${UV_SOURCE[@]}" "${ASM_SOURCE[@]}" \
    -lpthread -ldl -lrt \
    ../../examples/ex2_libuv.c -o ex2_libuv
