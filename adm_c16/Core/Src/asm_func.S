.syntax unified
.thumb
.text

@ Simbolos exportados
.global asm_svc
.global asm_sum


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_svc (void)
@
.thumb_func
    asm_svc:
        svc 0
        bx lr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   uint32_t asmSum (uint32_t firstOperand, uint32_t secondOperand)
@
@ Parametros recibidos:
@   r0: firstOperand
@   r1: secondOperand
@
@ Valor de retorno:
@   r0: resultado de la suma de firstOperand y secondOperand
@
.thumb_func
    asm_sum:
        add r0, r1  @ r0 = r0 + r1
        bx lr       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void zeros(uint32_t * array, uint32_t len)
@	r0 direction of array
@	r1 length of array
.thumb_func
    asm_zeros:
    	cbz r0, exit_zeros @ compare with null pointer, exit if true
    	cbz r1, exit_zeros @ compare with zero, exit if true
    	mov r2, #0 @ put zero in R2 (value to set)
    zeros_loop:
		str r2, [r0], #4 @ store word (0) to memory r0 then update r0 to r0+4
		subs r1, #1
		bne zeros_loop
	exit_zeros:
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void productoEscalar32(uint32_t * vectorIn, uint32_t * vectorOut, uint32_t longitud, uint32_t escalar)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
@	r3 factor
.thumb_func
    asm_productoEscalar32:
        cbz r0, exit_prod32 @ compare with null pointer, exit if true
    	cbz r1, exit_prod32 @ compare with null pointer, exit if true
    	cbz r2, exit_prod32 @ compare with zero, exit if true
    	push {r4,r5}
    asm_32_loop:
    	mov r5, r0 @ copy the value in r0 to the buffer r5
		mul r4, r5, r3 @ multiply value pointed to by r0 with value in r3
		str r4, [r1], #4  @ store the result in r1 and update r1 to r1+4
		subs r2, #1
		bne asm_32_loop
	exit_prod32:
		pop {r4-r5}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void productoEscalar16(uint16_t * vectorIn, uint16_t * vectorOut, uint16_t longitud, uint16_t escalar)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
@	r3 factor
.thumb_func
    asm_productoEscalar16:
        cbz r0, exit_prod16 @ compare with null pointer, exit if true
    	cbz r1, exit_prod16 @ compare with null pointer, exit if true
    	cbz r2, exit_prod16 @ compare with zero, exit if true
    	push {r4,r5}
    asm_16_loop:
        mov r5, r0 @ copy the value in r0 to the buffer r5
		mul r4, r5, r3 @ multiply value pointed to by r0 with value in r3
		strh r4, [r1], #2  @ store the result in r1 and update r1 to r1+2 (HALF WORD)
		subs r2, #1
		bne asm_16_loop
	exit_prod16:
		pop {r4-r5}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void productoEscalar12(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
@	r3 factor
.thumb_func
    asm_productoEscalar12:
        cbz r0, exit_prod12 @ compare with null pointer, exit if true
    	cbz r1, exit_prod12 @ compare with null pointer, exit if true
    	cbz r2, exit_prod12 @ compare with zero, exit if true
    	push {r4,r5}
    asm_12_loop:
        mov r5, r0 @ copy the value in r0 to the buffer r5
		mul r4, r5, r3 @ multiply value pointed to by r0 with value in r3
		strh r4, [r1], #2  @ store the result in r1 and update r1 to r1+2 (HALF WORD)
		subs r2, #1
		bne asm_16_loop
	exit_prod12:
		pop {r4-r5}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   iltroVentana10(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitudVectorIn)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
.thumb_func
	asm_filtroVentana:
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void pack32to16(int32_t * vectorIn, int16_t *vectorOut, uint32_t longitud)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
.thumb_func
	asm_pack32to16:
		cbz r0, exit_pack @ compare with null pointer, exit if true
    	cbz r1, exit_pack @ compare with null pointer, exit if true
    	cbz r2, exit_pack @ compare with zero, exit if true
	pack_loop:
		mov r3, #4095
		cmp r0, r3
		bgt branch_upper_limit
		mov r3, r0
		strh r3, [r0], #2
		subs r2, #1
		bne pack_loop
		b exit_pack
	branch_upper_limit:
		mov r3, 0xFFFF
		strh r3, [r0], #2
		subs r2, #1
		bne pack_loop
	exit_pack:
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@ 	int32_t  max(int32_t * vectorIn, uint32_t longitud)
@	r0 direction of vectorIn
@	r1 longitud
.thumb_func
	asm_max:
		cbz r0, exit_max @ compare with null pointer, exit if true
    	cbz r1, exit_max @ compare with null pointer, exit if true
    	ldr r2, [r0]@ copy the value to the buffer
    	mov r3, #0 @ direction of maximum value
    	push {r4-r5}
    	mov r5, #0 @ counting variable
    max_loop:
    	ldr r4, [r0], #4 @load to r4 the value of r0, and increment r0 one word
    	cmp r2, r4 @compare r0 with current max
    	bgt new_max @if greater than, jump to new max
    	add r5, #1 @add 1 to the counter
    	subs r2, #1 @decrease 1 from the long
    	bne max_loop @branch back to loop
    	b exit_max @branch exit
    new_max:
    	mov r2, r4 @ new max, set the value of max to the value of r4
    	add r5, #1 @increase the counter
    	mov r3, r5 @set the location of maximum value to counter
    	subs r2, #1 @decrease the longitud
    	bne max_loop
    exit_max:
        mov r0, r3 @copy return value to r0
        pop {r4-r5} @restore
    	bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   downsampleN(int32_t * vectorIn, int32_t * vectorOut, uint32_t longitud, uint32_t N)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
@	r3 N
.thumb_func
	asm_downsampleN:
		cbz r0, exit_downsample @ compare with null pointer, exit if true
    	cbz r1, exit_downsample @ compare with null pointer, exit if true
    	cbz r2, exit_downsample @ compare length to 0, exit if true
    	cbz r3, exit_downsample @ compare N to 0, exit if true
    	push {r4} @push r4, popping later
    	mov r4, #1 @used to compare with N
	downsample_loop:
		cmp r4, r3 @compare N to looping variable
		beq equal_downsample @if equal dont store it
		str r1, [r0], #4 @if not equal store it
		add r4, #1 @increase the looping variable
		subs r2,#1 @decrease length, set ASPR
		bne downsample_loop @if length is not zero loop again
		b exit_downsample @if length is zero exit
	equal_downsample:
		mov r4, #1 @if equal then restore looping variable to zero
		subs r2, #1 @substract from length, set ASPR
		bne downsample_loop @if not zero loop again
	exit_downsample:
		pop {r4}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   invertir(uint16_t * vector, uint32_t longitud)
@	r0 direction of vector
@	r1 lenght of array
.thumb_func
	asm_invertir:
		cbz r0, exit_invertir @ compare with null pointer, exit if true
    	cbz r1, exit_invertir @ compare with zero, exit if true
    	push {r4} @push r4
    	mov r3, r1 @load the length into r3
    	mov r4, r0 @load the address of the vector in r4
	invertir_push_loop:
		ldr r2, [r0], #4 @ read the value in r0 then move r0 one word
		push {r2} @ push the value to the stack
		subs r1, #1 @ substract one from length, update ASPR
		bne invertir_push_loop
	invertir_pop_loop:
		pop {r2} @get the last item from the stack
		ldr r4, [r2], #4 @save that value in r4, which is the address of the vector, and increase 4
		subs r3, #1
		bne invertir_pop_loop
	exit_invertir:
		pop {r4}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void echo(uint16_t * vectorIn, uint32_t longitud)
@	r0 direction of vectorIn
@	r1 lenght of array
.thumb_func
	asm_echo:
		cbz r0, exit_echo @ compare with null pointer, exit if true
		push{r4-r5}
		mov r5, #882
		subs r1, r5 @compare with minimum size
		bmi exit_echo @if negative exit
		mov r2, r0 @r4 has address of vectorIn
		add r2, #1764 @r4 has address of vectorIn+882 halfwords
	echo_loop:
		ldrh r3, [r0], #2 @load one halfword into r3
		asr r3, 1 @divide by two
		ldrh r4, [r2] @ load the value of the destination halfword
		qadd16 r3, r3, r4 @ saturated add
		strh r3, [r2], #2 @ store the result
		subs r1, #1
		bne echo_loop
	exit_echo:
		pop{r4-r5}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void productoEscalar12(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
@	r3 factor
.thumb_func
	asm_echo_simd:
		cbz r0, exit_echo @ compare with null pointer, exit if true
		push{r4-r6}
		mov r5, #882
		subs r1, r5 @compare with minimum size
		bmi exit_echo @if negative exit
		mov r2, r0 @r4 has address of vectorIn
		add r2, #1764 @r4 has address of vectorIn+882 halfwords
	echo_simd_loop:
		ldr r3, [r0], #4 @load two halfwords into r3
		lsr r5, r3, #16 @shift to get the upper halfword in r5
		asr r5, #1 @divide by two
		lsl r6, r3, #16 @shift to remove the upper halfword
		lsr r6, r6, #16 @shift to return the lower halfword
		asr r6, #1 @divide by two
		orr r3, r5, r6 @return both divided halfwords to r3
		ldr r4, [r2] @load two destination halfwords into r4
		shadd16 r3, r3, r4 @SIMD add the two halfwords
		strh r3, [r2], #4 @store the result then move two halfwords
		subs r1, #2
		bne echo_loop
	exit_echo_simd:
		pop{r4-r6}
		bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void productoEscalar12(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar)
@	r0 direction of vectorIn
@	r1 direction of vectorOut
@	r2 lenght of arrays
@	r3 factor
.thumb_func
	asm_corr:
		bx lr
