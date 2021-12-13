.data

	fmt0: .asciz "Type Your String:\n"
	fmt: .asciz "Your string as an int: %i\n"
	fmt2: .asciz "%18s"

.text

.global main

main:
	stp x29, x30, [sp, #-16]!
main2:
	/*******************************************/
	// Prompt user for input
	ldr x0,=fmt0
	bl	printf
	/*******************************************/
	// get the input	
	add sp,sp,#-32
	ldr x0,=fmt2
	mov x1,sp
	bl scanf
	//bl flush
	/*******************************************/
	// check for proper input
	mov x0,sp
	bl check
	cmp x0,#0
	b.lt main2
	/*******************************************/
	// Convert string to int
	mov x0, sp
	bl str2int
	// we need whats in w4 to be in x1
	//str w4,[sp, #-16]!
	//ldr x1, [sp], #16
	mov w1,w4
	// print
	ldr x0,=fmt
	bl printf
	/*******************************************/
	// finish the code
	add sp,sp,#32
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret

// Convert a string to an int
str2int:
	stp x29,x30,[sp,#-16]!
	mov x1,#0
	loop2:
		ldrb w2,[x0, x1]	//load a byte
		cbz w2, convert		//if null terminator, finish function
		add x1,x1,#1
		b loop2
	convert:
		add x1,x1,#-1
		mov w4,#0
		mov w5,#1 // value to mul by
		mov w6,#10
		loop3:
			ldrb w2,[x0, x1]	//load a byte
			cmp w2,#45 // "-" is 45 in ASCII
			b.eq mulneg1 // if(w2==45){mult by -1}else{do next}
			cmp w2,#43 // "+" is 43 in ASCII
			b.eq end // if(w2==43){end}else{do next}
			add w3,w2,#-48 //not a sign?->Convert char to int
			mul w3,w3,w5
			mul w5,w5,w6
			add w4,w4,w3
			add x1,x1,#-1
			cmp x1,#0 
			b.lt end // is x1 < 0? No: loop again, else: end
			bl loop3
		mulneg1:
			mov w1,#-1
			mul w4,w4,w1
			bl end

// Check for a valid input from user
check:
	stp x29,x30,[sp,#-16]!
	b check_sign
	mov x1, #1		//initialize counter
	
	check_sign:
	// Check if the value in index 0 is "+" or "-"
		ldrb w2,[x0, #0]	//load a byte
		cbz w2, end		//if null terminator, finish function
		cmp w2,#45 // "-" is 45 in ASCII
		b.eq increment // if(w2==45){increment}else{do next}
		cmp w2,#43 // "+" is 43 in ASCII
		b.eq increment // if(w2==43){increment}else{do next}
	
	loop:

		ldrb w2,[x0, x1]	//load a byte
		cbz w2, end		//if null terminator, finish function

		/*******************************************/
		// Checks that value is a number
        cmp w2,#48 // 0 is 48 in ASCII
		b.lt err // if(w2<48){error}else{do next}
		cmp w2,#57 // 9 is 57 in ASCII
		b.gt err // if(w2>57){erro}else{do next}
		/*******************************************/
		b increment
		//add x1,x1,#1	//increment counter
		//b loop

	end:
	// end the program
		mov x0,x1
		ldp x29,x30,[sp],#16
		ret
	increment:
	// increment the loop
		add x1,x1,#1
		b loop
    err:
	// if an error in input
		mov x0,#-1
		ldp x29,x30,[sp],#16
		add sp, sp, #32
		ret
