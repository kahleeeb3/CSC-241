.data
	str: .asciz "The value of Fibonacci number %li is %li\n"

.text

.global main

main:
    stp x29,x30,[sp,#-16]!

    // 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
	mov x0,#8 // x0 = n
	mov x4,x0 // x4 = n

	bl fib // run the fib function

	mov x2,x0 // x2 = f(n)

	ldr x0,=str // load the string
	bl printf // print stuff
	ldp x29,x30,[sp],#16
	mov w0,#0 // w0 = 0
	ret

// x0,x1,x2 used

fib:
	stp x29,x30,[sp,#-16]!

	// if(x0!=0){do next} else{go to "is_zero"}
	cmp x0,#0
	b.eq is_zero 

	// if(x0!=1){do next} else{go to "is_one"}
	cmp x0,#1
	b.eq is_one

    // if(x0!=2){do next} else{go to "is_one"}
	cmp x0,#2
	b.eq is_one

	// elif statement
	b recursive_case
	
	is_zero:
		mov x0,#0
		b end
	is_one:
		mov x0,#1
		b end
	recursive_case:
        // fib(n-1)
        str x0,[sp,#-16]! // str x0 to stack
        sub x0,x0,#1 // sub 1
        bl fib // bl fib
        ldr x1,[sp],#16 // pop x1 from stack
        str x0,[sp,#-16]! // push fib(n-1) to stack
        // fib(n-2)
        sub x0,x1,#2 // sub 1 again
        bl fib // bl fib
        ldr x1,[sp],#16 // pop fib(n-1) off stack
        add x0,x1,x0 // add to fib(n-2)
        b end // return
	end:
        mov x1, x4
		ldp x29,x30,[sp],#16
		ret


/*
def Fibonacci(n):
	if n == 0:
		return 0
	elif n == 1 or n == 2:
		return 1
	else:
		return Fibonacci(n-1) + Fibonacci(n-2)
*/