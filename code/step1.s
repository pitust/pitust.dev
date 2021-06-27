bits 16
org 0xf0000

main:
  jmp $

times (0x10000 - 16) - ($ - $$) db 0x00

reset_vector:
    jmp 0xf000:0
    times 11 db 0