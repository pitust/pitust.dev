bits 16
org 0xf0000

main:
  mov eax, GDTR
  lgdt [eax]
  mov eax, cr0
  or eax, 1
  mov cr0, eax
  db 0x66
  db 0xea
  dd protected_mode
  dw 0x08

bits 32
protected_mode:
  mov ax, 0x10
  mov ss, ax
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  jmp $

GDT:
  dq 0
  dq 0x00cf9a000000ffff
  dq 0x00cf93000000ffff
GDTR:
  dw 0xff
  dd GDT

times (0x10000 - 16) - ($ - $$) db 0x00
bits 16

reset_vector:
  jmp 0xf000:0
  times 11 db 0