	.section	.text
	.global		monthlen
	.type		monthlen,	%function
monthlen:
	push {r4-r7,lr}
	mov r4, r0 @ y
	mov r5, r1 @ m
	
	mov r6, #0 @ r6=q
	mov r7, #0 @ r7=rv
	@ q = (y%4==0)
	mov r0, r4
	mov r1, #4
	bl modsub @y%4
	cmp r0, #0
	addeq r6, r6, #1
	addne r6, r6, #0
	@ q -= (y%100==0)
	mov r0, r4
	mov r1, #100
	bl modsub @y%100
	cmp r0, #0
	subeq r6, r6, #1
	subne r6, r6, #0
	@ q += (y%400==0)
	mov r0, r4
	mov r1, #400
	bl modsub @y%400
	cmp r0, #0
	addeq r6, r6, #1
	addne r6, r6, #0

	@ if(m==2)
	cmp r5, #2
	beq feb
	@ else
	@ 1,3,5,7,8,10,12月は31日
	cmp r5, #1
	addeq r7, #31
	cmp r5, #3
	addeq r7, #31
	cmp r5, #5
	addeq r7, #31
	cmp r5, #7
	addeq r7, #31
	cmp r5, #8
	addeq r7, #31
	cmp r5, #10
	addeq r7, #31
	cmp r5, #12
	addeq r7, #31
	@ 4,6,9,11月は30日
	cmp r5, #4
	addeq r7, #30
	cmp r5, #6
	addeq r7, #30
	cmp r5, #9
	addeq r7, #30
	cmp r5, #11
	addeq r7, #30
	b end
feb:
	@ if(q)
	cmp r6, #1
	addeq r7, #29
	@ else
	addne r7, #28
end:
	mov r0, r7
	pop {r4-r7,lr}
	bx lr
