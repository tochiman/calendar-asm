	.section	.text
	.global		mk1cal
	.type		mk1cal,		%function
mk1cal:
	push {r4-r12,lr}
	mov r4, r0 				@ y
	mov r5, r1 				@ m
	mov r6, #0				@ r6=dlen
	mov r7, #0				@ r7=woff
	mov r8, #0				@ r8=r
	mov r9, #1				@ r9=d
	mov r10, #0				@ r10=c
	mov r11, #0				@ r11=b
	mov r12, r2				@ r12=char*

	@ Call monthlen of function
	mov r0, r4
	mov r1, r5
	bl monthlen
	mov r6, r0
	@ Call monthwoffset of function
	mov r0, r4
	mov r1, r5
	mov r2, #1
	bl monthwoffset
	mov r7, r0				@ monthwoffsetの返り値をwoff(r7)に格納

	@ for(d=1;d<=dlen;d++){ ... }
for:
	cmp r9, r6
	bgt for_done
	@ cの計算
	add r10, r7, r9
	sub r10, r10, #1
	add r10, r10, #7
	@ 剰余の計算
	mov r0, r10
	mov r1, #7
	bl modsub
	mov r10, r0 		@ cの計算終了
	@ bの計算
	mov r0, #21			@ 一時変数r0の使用  
	mul r11, r8, r0
	mov r0, #3			@ 一時変数r0の使用 
	mul r0, r10, r0		@ 一時変数r1の使用 
	add r11, r11, r0	@ bの計算終了
@ if(d>=10)
if_d:
	cmp r9, #10
	blt if_d_done
	@ canvas[b] = d/10 + '0'
	mov r0, r9
	mov r1, #10
	bl divsub
	add r0, r0, #48		@ 一時変数r0の使用 
	cmp r0, #0
	beq if_d_done
	strb r0, [r12, r11]
	
if_d_done:
	add r11, r11, #1	@ b++
	@ canvas[b] = d%10 + '0'
	mov r0, r9
	mov r1, #10
	bl modsub
	add r0, r0, #48		@ 一時変数r0の使用 
	cmp r0, #0
	beq if_c
	strb r0, [r12, r11]

@ if(c>=IW-1)
if_c:
	cmp r10, #6
	blt if_c_done
	add r8, r8, #1
if_c_done:
	add r9, r9, #1 @ for次のループへ
	b for

for_done:
	pop {r4-r12,lr}
	bx lr
