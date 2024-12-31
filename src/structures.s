; data structures used throughout

struc safe_text_node
    count: resw 1
    data: resb 1024
endstruc

struc node
    text_node_ptr: resd 1
    next_node_ptr: resd 1
endstruc

; Linked-List of buffers to allocate during parsing.
struc dynamic_buffer
    mmap_address: resq 1
    sz: resq 1
    buffer_offset: resq 1

    next_buffer_ptr: resq 1
endstruc
