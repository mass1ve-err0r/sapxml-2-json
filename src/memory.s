; global memory and memory function declarations
%include "src/syscalls.s"

%define MMAP_PROT_READ 0x1
%define MMAP_PROT_WRITE 0x2
%define MMAP_MAP_PRIVATE 0x2
%define MMAP_MAP_ANONYMOUS 0x20


section .bss
    g_file_stat resb 144
    g_dynamic_buffer_start resq 1
    g_dynamic_buffers resb 8*4
    g_dynamic_buffer_size resq 1
    g_dynamic_subsystem_flags resq 1
    g_flags resq 1

section .text
    global clear_memory


__malloc:
    good_noodle_prologue

    mov rsi, rax
    mov [g_dynamic_buffer_size], rax
    mov rax, SYS_MMAP
    xor rdi, rdi
    mov rdx, MMAP_PROT_READ | MMAP_PROT_WRITE
    mov r10, MMAP_MAP_PRIVATE | MMAP_MAP_ANONYMOUS
    xor r8, r8
    xor r9, r9
    syscall

    mov [g_dynamic_buffer_start], rax
    good_noodle_epilogue
    ret


__free:
    good_noodle_prologue

    mov rax, SYS_MUNMAP
    mov rdi, [g_dynamic_buffer_start]
    mov rsi, g_dynamic_buffer_size
    syscall

    good_noodle_epilogue
    ret

