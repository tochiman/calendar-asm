    .section .text
    .global showheader
    .type   showheader, %function

showheader:
    push {r4-r9,lr}
    mov r4, r0              @ charの配列
    ldr r5, =dayofweek      @ dayofweekのアドレスを持ってくる
    mov r6, #0              @ forでループ回数を管理するために使う
    mov r7, #0              @ dayofweekから読み取った文字を格納するよう   
    mov r8, r1              @ 年を格納
    mov r9, r2              @ 月を格納

    add r4, r4, #7
    mov r0, r8
    mov r1, r4
    bl pdec
    add r4, r4, #5

    mov r0, r9
    mov r1, r4
    bl pdec
    add r4, r4, #9

    @月曜始まりの場合0が入っているため３バイトずらず
    addeq r5, r5, #3
    
    @ for(r6=0; r6 <= 21; r6++)
for_dow:
    cmp r6, #21            
    beq for_dow_done        @　forループ終了(r6が22になったら)
    ldrb r7, [r5, r6]       @　r7にdayofweekのアドレスから読み取った文字を書き込む
    strb r7, [r4, r6]       @　r7をchar配列のメモリに書き込む
    add r6, r6, #1
    b for_dow               @ ループ続行

for_dow_done:
    add r4, r4, #21         @ 曜日が終わって改行をしてる
    mov r0, r4              @ charの配列を返してる
    pop {r4-r9,lr}
    bx lr

	.section .data
dayofweek:
	.ascii "Su Mo Tu We Th Fr Sa Su "
    

