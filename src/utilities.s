%include "src/exit.s"
%include "src/memory.s"
%include "src/syscalls.s"

%define FILE_SIZE_OFFSET 48


section .text
    extern _exit_error

; gets the file size. does NOT flush the used buffer.
get_file_size:
    mov rax, SYS_STAT
    mov rdi, [rsp + 8]     ; (+8 call bytes), argv[1] aka pointer to the first argument
    lea rsi, [g_file_stat]
    syscall

    cmp rax, ASM_RETURN_SUCCESS
    jl _exit_error

    mov rax, [g_file_stat + FILE_SIZE_OFFSET]
    ret
