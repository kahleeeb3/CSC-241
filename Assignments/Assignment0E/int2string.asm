.data

	fmt0: .asciz "Type Your Int:\n"
	fmt: .asciz "Your Int as an string: %s\n"
	fmt2: .asciz "%18li"

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
	//mov x0,sp
	//bl check
	//cmp x0,#0
	//b.lt main2
	/*******************************************/
	// Convert string to int
	ldr x0, [sp]
    add sp,sp,#-32
    mov x3,sp
	bl int2str
	// print
	
	mov x0,sp
	sub sp,sp,#32
	mov x3,sp
	bl flipdabitch
	
	ldr x0,=fmt
    mov x1,sp
	bl printf
	/*******************************************/
	// finish the code
	add sp,sp,#64
    add sp,sp,#32
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret

// Convert a string to an int
int2str:
    mov x6,x0 // just keep the number in x6 for now
        // x0 is where the user input is stored
    mov x1,#0 // stores the current index
        // x2 is where the char is stored
    mov x4,#10 // stores the value of 10 for division
	stp x29,x30,[sp,#-16]!
    cmp x0,#0
    b.lt isnegative
    loop:
        // x0:25626
        udiv x2,x0,x4 // x2:252
        mov x5,x2 // x5:252
        mul x2,x2,x4 // x2:2520
        sub x2,x0,x2 // x2:2526-2520 = 6
        add x2,x2,#48 // convert to char
        strb w2, [x3,x1]
        add x1,x1,#1
        // if x5 == 0: break
        cmp x5,#0
        b.eq appendneg
        mov x0,x5 // x0: 252
        b loop //b

// put a neg sign on it if need be
appendneg:
    cmp x6,#0
    b.gt end
    mov x2,#45
    strb w2, [x3,x1]
    b end


isnegative:
    mov x5,#-1
    mul x0,x0,x5
    b loop

end:
    ldp x29,x30,[sp],#16
	ret
	
	
	
flipdabitch:
    stp x29,x30,[sp,#-16]!

    mov x1,#0 // current counter
    len:
    // get the length of the string
        ldrb w2,[x0, x1] //load a byte
        cbz w2, flip
        add x1,x1,#1
        b len
    flip:
    mov x4, #0 // make x4 start at 0
    sub x1,x1,#1 // make x1 start at length - 1
        flip2:
            ldrb w2,[x0,x1] 
            strb w2,[x3,x4]
            cmp x1,#0
            b.eq endflipdabitch
            add x4, x4, #1
            sub x1, x1, #1
            b flip2
	    	
    endflipdabitch:
    add x4,x4,#1
    mov w2,#0
    strb w2, [x3,x4]
    ldp x29,x30,[sp],#16
    ret
	
