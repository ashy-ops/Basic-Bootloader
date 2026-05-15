gdt_start:
    ; 1. The Mandatory Null Descriptor (Exactly 8 bytes of zeros)
    dq 0x0         ; 'dq' defines a Quad-word, which is 8 bytes. 
                   ; Alternatively, use: dd 0x0, dd 0x0

    ; 2. The Code Segment Descriptor(0x 00 CF 9A 00 00 00 FF FF)byte 7to 0
    gdt_code: 
        dw 0xffff    ; Limit (bits 0-15)
        dw 0x0       ; Base Low(bits 0-15)
        db 0x0       ; Base Mid(bits 16-23)
        db 10011010b ; Access byte
        db 11001111b ; Flags (upper 4 bits) + Limit (bits 16-19)
        db 0x0       ; Base High (bits 24-31)

;See the table in GDT Segment Descriptor Layout

    ; 3. The Data Segment Descriptor(0x 00 CF 92 00 00 00 FF FF)
    gdt_data:
        dw 0xffff    
        dw 0x0       
        db 0x0       
        db 10010010b ; Writable=1, Executable=0
        db 11001111b 
        db 0x0       
gdt_end:
;Labels are used for calculation of size

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ; Size of GDT (16-bit)
    dd gdt_start               ; Address of GDT (32-bit)

;CONSTANTS
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start