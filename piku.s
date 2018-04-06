    .syntax unified

    @ --------------------------------
    .global main
main:
    @ Stack the return address (lr) in addition to a dummy register (ip) to
    @ keep the stack 8-byte aligned.
    push    {ip, lr}

    @ Load the first line of the piku and perform the call.
    ldr     r0, =message1
    bl      printf

    @ Load the second line of the piku and perform the call.
    ldr     r0, =message2
    bl      printf

    @ Load the third line of the piku and perform the call.
    ldr     r0, =message3
    bl      printf

    @ Exit from 'main'. This is like 'return 0' in C.
    mov     r0, #0      @ Return 0.
    @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
    @ value directly into pc — the Program Counter — to return.
    pop     {ip, pc}

    @ --------------------------------
    @ Data for the printf call. The GNU assembler's ".asciz" directive
    @ automatically adds a NULL character termination.
message1:
    .asciz  "Ah, Raspberry Pi\n"

message2:
    .asciz "a sweet little computer\n"

message3:
    .asciz "with a sweeter name.\n"
