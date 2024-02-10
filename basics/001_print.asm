  format ELF64 executable 3      ; declare the binary format as an ELF 64-bit executable for Linux (3)

  segment readable executable    ; code segment

  entry main                     ; declare the program entry point

  main:
    mov    rax, 5                ; copy 5 into rax (accumulator register)
    add    rax, 48               ; add 48 (ASCII value 0) to the value in rax 
    mov    [number], rax         ; copy the value in rax into the variable (memory address) named number

    mov    rax, 1                ; sys_write (
    mov    rdi, 1                ; stdout file descriptor
    mov    rsi, number           ; character buffer
    mov    rdx, 1                ; buffer length
    syscall                      ; )

    mov    rax, 60               ; sys_exit (
    mov    rdi, 0                ; exit code
    syscall                      ; )
  
  segment readable writable      ; data segment 

    number dq ""                 ; define a variable named number of size quadword (8 bytes)
