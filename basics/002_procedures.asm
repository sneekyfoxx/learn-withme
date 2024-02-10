  format ELF64 executable 3

  segment readable executable

  entry main

  main:                  ; procedure named main
    mov  rbx, 5          ; copy 5 into rbx
    add  rbx, 48         ; add 48 to the value in rbx

    call print           ; goto the print procedure

    mov  rax, 60         ; sys_exit (
    mov  rdi, 0          ; exit code
    syscall              ; )

  print:                 ; procedure named print
    mov  [number], rbx   ; copy the value from rbx into the variable named number

    mov  rax, 1          ; sys_write (
    mov  rdi, 1          ; file descriptor (stdout)
    mov  rsi, number     ; character buffer
    mov  rdx, 1          ; buffer length
    syscall              ; )
    ret                  ; goto main procedure

  segment readable writable
    number dq ""
