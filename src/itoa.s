%include "src/file_descriptors.s"
%include "src/syscalls.s"


section .text


print_rax:
    good_noodle_prologue

    sub rsp, 32
    lea rsi, [rsp + 31]
    xor rcx, rcx

itoa_loop:
    xor rdx, rdx
    div rdi
    add dl, '0'
    dec rsi
    mov [rsi], dl
    inc rcx                               ; Increment string length counter
    test rax, rax
    jnz itoa_loop

    ; Print the number
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rdx, rcx
    syscall

    add rsp, 32
    good_noodle_epilogue
    ret
