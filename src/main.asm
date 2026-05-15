[org 0x7c00]
jmp start_bootloader

[bits 16]

start_bootloader:
    jmp switch_to_pm    ;Use call if you wish to switch back to 16-bit mode ever again

switch_to_pm:
    mov ah,0x00
    mov al,0x03
    int 0x10
    
    cli                     ;Disable interrupts (BIOS interrupts crash in 32-bit mode)
    lgdt [gdt_descriptor]   ;Load the GDT pointer into the GDT register

    mov eax, cr0            ;Set the first bit of control register CR0 as 1
    or eax, 0x1             ;This is the "protected mode enable" bit

    mov cr0, eax 

    ;The far jump
    jmp CODE_SEG:init_pm
    jmp $

[bits 32]
init_pm:
    mov ax,DATA_SEG
    mov ds,ax
    mov ss,ax      
    mov es,ax   
    mov fs,ax   
    mov gs,ax   

    mov ebp,0x90000
    mov esp,ebp 
    
    call begin_pm

[bits 32]
begin_pm:
    mov ebx,success_message
    call print_string
    jmp $

;---INCLUDES---;
%include "gdt.asm"  ;GDT table structure
%include "print.asm";Print function without BIOS interrupts

;---DECLARATIONS---;
success_message:
    db 'Sucessfully Entered 32-Bit mode!',0

;----BOOT SECTOR PADDING-----;
times 510-($-$$) db 0
dw 0xaa55

