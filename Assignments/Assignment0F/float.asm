/*
Assignment 0F: Fun with Floats

This assignment is motivated by the fast inverse square root trick from Quake III:
https://en.wikipedia.org/wiki/Fast_inverse_square_root

1. Accepts a floating point number from the user (64 bit), call it X
2. Uses built-in ARM commands to compute 1/Sqrt(X)
3. Computes 1/sqrt(X) using the Magic Constant
4. Outputs all the values with appropriate labeling

You'll be doing this with 64 bit doubles, not 32 bit singles. Also, look over the book's example for sine with fmadd looping, as we'll need this sort of idea later.
*/

.data
	magic32: .dword 0x5FE6EB50C7B537A9
	fmt0: .asciz "Type Your Number: "
	fmt1: .asciz "%f"
	fmt2: .asciz "The InvSqrt is %f\n"
	fmt3: .asciz "The InvSqrt is ~%f\n"
.text

.global main

main:
	stp x29, x30, [sp, #-16]!

    /********************************/
    // Prompt user to input string
	ldr x0,=fmt0
	bl	printf
    /********************************/
	// get the user input
	add sp,sp,#-32 // Make space in stack pointer for string
	ldr x0,=fmt1 // load in the input string
	mov x1,sp
	bl scanf
    /********************************/
    mov x1,sp // Place user input in x1 for printing
    ldr s0, [x1] // load register s0 with value in x1
    fcvt d0, s0 // convert a 32 bit float to a 64 bit float
    /********************************/
	// calculate invsqrt
	bl sqrt // Pass x0 into the function
	fmov d1,d0 // move output of function for printing
    /********************************/
	// Print the output
	ldr x0,=fmt2
	bl	printf
	/********************************/
	// approx invsqrt
	/////////////////////////////////////////////////////////////
	// copy user input back into d0
	mov x1,sp // Place user input in x1 for printing
    ldr s0, [x1] // load register s0 with value in x1
    fcvt d0, s0 // convert a 32 bit float to a 64 bit float
	/////////////////////////////////////////////////////////////
	bl sqrt2 // Pass x0 into the function
	fmov d1,d0 // move output of function for printing
	/********************************/
	// Print the output
	ldr x0,=fmt3
	bl	printf
	/********************************/
	add sp,sp,#32
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret

sqrt:
// Uses built-in ARM commands to compute 1/Sqrt(X)
	stp x29,x30,[sp,#-16]!
	fmov d1, #1.0
	fsqrt d0,d0
	fdiv d0,d1,d0
	ldp x29,x30,[sp],#16
	ret

sqrt2:
// Computes 1/sqrt(X) using the Magic Constant 0x5FE6EB50C7B537A9.
// i = * ( long * ) &y;
	FMOV x0,d0
// i = 0x5f3759df - ( i >> 1 );
	ldr x1,=magic32
	LDR x2,[x1] // loads magic32 to S2
	LSR x0,x0,#1 // shift s0 right by one position
	SUB x0,x2,x0 // subtract shifted number from magic constant
// y = * ( float * ) &i;
	FMOV d0,x0
	ret

/*
float Q_rsqrt( float number )
{
	long i;
	float x2, y;
	const float threehalfs = 1.5F;

	x2 = number * 0.5F;
	y  = number;
	i  = * ( long * ) &y;                       // evil floating point bit level hacking
	i  = 0x5f3759df - ( i >> 1 );               // what the fuck? 
	y  = * ( float * ) &i;
	y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
	//y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed

	return y;
}
*/
