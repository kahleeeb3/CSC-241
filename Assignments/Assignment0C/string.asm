.data
	fmt0: .asciz "Type Your String:\n"
	fmt1: .asciz "%[^\n]31s"
	fmt2: .asciz "Original: %s, Changed: %s\n"
.text

.global main

main:
	stp x29, x30, [sp, #-16]!

	// Prompt user to input string
	ldr x0,=fmt0
	bl	printf

	add sp,sp,#-64 // Make space in stack pointer for string
	ldr x0,=fmt1 // load in the input string
	mov x1,sp
	bl scanf // get the user input

	// Copy the string to the upper part of the stack by 16 byte chunks
	ldp x0,x1,[sp]
	stp x0,x1,[sp,#32]
	ldp x0,x1,[sp,#16]
	stp x0,x1,[sp,#48]

	mov x0,sp // Place user input in x

	/* =========================================== */
	bl change // Pass x0 into the change function
	/* =========================================== */
	
	mov x2, sp
	mov x1,sp
	add x1,x1,#32

	ldr x0,=fmt2
	bl	printf
	
	add sp,sp,#64
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret

change:
	stp x29,x30,[sp,#-16]!
	mov x1, #0 //initialize counter
	mov x22,#1 // even = True
	loop:
		
		ldrb w2,[x0, x1] //load a byte
		cbz w2, end	//if null terminator, finish function

		cmp x22,#1 // detect if even
		b.eq is_even					// This can be done a lot easier I just dont know how
		cmp x22,#0 // detect if odd
		b.eq is_odd

		b increment

	is_even: //if((w2>A) && (w2<Z)){str[i]+32} // A = 65, Z = 90
		cmp w2,#65 // Z is 90 in ASCII
		b.lt increment_e // if(w2<65){increment}else{do next}
		cmp w2,#90 // Z is 90 in ASCII
		b.gt increment_e // if(w2>90){increment}else{do next}

		add w2, w2, #32 // change to lower if upper
		strb w2,[x0, x1]
		b increment_e
	is_odd: //if((w2>a) && (w2<z)){str[i]-32} // a = 97, z = 122
		cmp w2,#97 // Z is 90 in ASCII
		b.lt increment_o // if(w2<97){increment}else{do next}
		cmp w2,#122 // Z is 90 in ASCII
		b.gt increment_o // if(w2>122){increment}else{do next}

		sub w2, w2, #32 // change to lower if upper
		strb w2,[x0, x1]
		b increment_o
		
	increment: // increment the counter
		add x1,x1,#1 //increment counter
		b loop // go back through loop
	increment_e: // increment that changes even to false
		mov x22,#0	// set even to true
		add x1,x1,#1 //increment counter
		b loop	// go back through loop
	increment_o: // increment that changes even to true
		mov x22,#1	// set even to true
		add x1,x1,#1 //increment counter
		b loop // go back through loop
	end:
		mov x0,x1
		ldp x29,x30,[sp],#16
		ret
		