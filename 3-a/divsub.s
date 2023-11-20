	.section 	.text
	.global		divsub
	.type		dibsub,		%function

divsub:
    mov r2, r1
    mov r1, r0
    mov r0, #0
loop:
    cmp r1, r2
    blt loopend
    add r0, r0, #1
    sub r1, r1, r2
    b loop
loopend:
    bx lr
