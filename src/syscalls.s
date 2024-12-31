; syscalls for Linux (x64)

%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_OPEN 2
%define SYS_CLOSE 3
%define SYS_EXIT 60

%define SYS_STAT 4
%define SYS_MMAP 9
%define SYS_MUNMAP 11


%macro good_noodle_prologue 0
       push rdi
       push rsi
       push rdx
%endmacro

%macro good_noodle_epilogue 0
       pop rdx
       pop rsi
       pop rdi
%endmacro
