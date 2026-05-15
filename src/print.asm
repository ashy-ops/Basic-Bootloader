[bits 32]

VIDEO_MEM equ 0xb8000
WHITE_COLOR equ 0x03

print_string:
    pusha
    mov edx, VIDEO_MEM

print_string_loop:
    mov al,[ebx]        ;First byte(ASCII character)
    mov ah,WHITE_COLOR  ;Second byte(For Font)

    cmp al,0
    je done

    ;else
    mov [edx],ax    ;Writing data
    
    add edx,2
    add ebx,1

    jmp print_string_loop

done:
    popa
    ret ;Return from Function