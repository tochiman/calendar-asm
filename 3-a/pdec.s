        .section        .text
        .global         pdec
        .type           pdec, %function
        @       pdec(int)

pdec:
        push {r4-r5, lr}
        mov r4, r1                 @ charの配列
        mov r5, #0                 @ forで使用する回数

        mov r1, #10
        mov r2, #35         
        push {r2}
PDL1:
        mov r3, #0
PDL2:
        cmp r0, r1
        blt PDL2OUT
        sub r0, r0, r1
        add r3, r3, #1
        b   PDL2
PDL2OUT:
        mov r2, r0
        push {r2}
        mov r0, r3
        cmp r0 ,#0
        ble PDL1OUT
        b  PDL1
PDL1OUT:

PDL3:
        pop {r2}
        cmp r2, #35
        beq PDL3OUT
        add r0, r2, #48
        strb r0, [r4, r5]
        add r5, r5, #1
        b PDL3
PDL3OUT:
        pop {r4-r5, lr}
        bx lr
