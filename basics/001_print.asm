  format ELF64 executable 3

  segment readable executable

  entry main

  main:
    mov    rax, 5            ; put 5 into rax register
    add    rax, 48           ; add 48 to rax  (5)
    mov    [number], rax     ; put rax (5) into variable number
    mov    rax, 1            ;)
    mov    rdi, 1            ; stdout
    mov    rsi, number       ; buffer
    mov    rdx, 1            ; sys_write(
    syscall

    mov    rax, 60
    mov    rdi, 0
    syscall
  
  segment readable writable
  
  number dq "", 0x00
