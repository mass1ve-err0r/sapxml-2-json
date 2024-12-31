%include "src/itoa.s"
%include "src/utilities.s"


section .text
    global _start
    extern _exit_error
    extern _exit_normal

_start:
    pop r11         ; grab argc
    add rsp, 8      ; skip over argv[0] (program path)
    
    cmp r11, 2
    jl _exit_error

    call get_file_size

    ;TODO: for now just print the file size in bytes we'll be parsing, assume it's small XMLs suitable for a SAP system.
    mov rdi, 10
    call print_rax
    call _exit_normal
