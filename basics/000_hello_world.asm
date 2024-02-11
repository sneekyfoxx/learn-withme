  format ELF64 executable 3

  segment readable executable

  entry main

  main:
    lea    rbx, [output]    ; load the address of the output varaible into the rbx register

    mov    rax, 0x01        ; sys_write (
    mov    rdi, 0x01        ;   stdout file descriptor
    mov    rsi, rbx         ;   character buffer
    mov    rdx, 0x06        ;   buffer length
    syscall                 ; )

    mov    rax, 0x3c        ; sys_exit (
    mov    rdi, 0x00        ;   exit code
    syscall                 ; )

  segment readable writable
    output dq "Hello", 10, 0
