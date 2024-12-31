%include "src/syscalls.s"

%define ASM_RETURN_SUCCESS 0
%define ASM_RETURN_ERROR 2

global _exit_error
global _exit_normal


section .text

_exit_error:
    mov rax, SYS_EXIT
    mov rdi, ASM_RETURN_ERROR
    syscall


_exit_normal:
    mov rax, SYS_EXIT
    mov rdi, ASM_RETURN_SUCCESS
    syscall
