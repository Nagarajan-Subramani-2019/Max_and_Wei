

/******************************************************************************
* file: Lab_Assignment_3.s
* author: Anil Kumar Devpura
* Guide: Prof. Madhumutyam IITM, PACE and G S Nitesh Narayana
******************************************************************************/

/*
  This is the starter code for assignment 2
  */

  @ BSS section
      .bss

  @ DATA SECTION
    .data
	data_start: .word 0x01 , 0x02 , 0x03,  0x04, 0x05, 0x06, 0x205A15E3, 0x256C8700
	data_end:   .word 0x295468F2 ;
	NUM: .word 0
	WEIGHT: .word 0

  @ TEXT section
      .text

.globl _main

/*

Output:
	1. R6: Number with max number of 1s
	2. R7: Total number of set bits
	Note: Both R6 and R7 finally Store in NUM and WEIGHT
=====
Algo:
=====
Step1 : Initialization
		a. get first (R0) and last element from data_start
		b. set R6 to first element and R to 0
@Step 2: Starting loop to consider all elements
		a. Initialize R4 to 1 [This register is used to check set bits for all 32 bits.]
		b. Initialize R3 to 0 [This register is used to hold number of 1 found in the current element]
		c. Load R2 with current element
		d. Start inner loop (to check all 32 bits for set bits one by one)
			d.1. Perform and between R4 and R2. if o/p is one that means particular bit is 1
				d.1.1. If o/p is one then, increase the value of R3 by 1.
			d.2 Shift R4 to Left for next bit verification.
			d.3 check if R4==0 .i.e End of loop or all 32 bits are verified and inner loop should break.
		e. Compare Number of set bits in R3 (current element) with R7 (best till this element)
			e.1: if R3 is more than update R6 and R7
		f. Move R0 to next element.
		d. Check if R0 has crossed R1 (last element) if yes then End of Step2 and programme with R6 and R7.			

*/

_main:
@Step1 : Initialization
	@Loading first element in the register R0
	ldr r0, first_data_items
	@Loading last element in the register R1
	ldr r1, last_data_items
	add r1,#4 @This is done to make sure last element is also consider
	
	ldr r6, [r0] @Output, To hold Num, which has highest number of 1s, init with 1st value
	ldr r7, =0x0 @Output, to hold number of 1s
	
@Step 2: Starting loop to consider all elements
	
	Loop:
		@ initializing r4 to 1 and it will be moved to Left for 32 times, ie this is used for check all 32 bits
		ldr r4, =0x00000001 
		@ R3 is used to hold number of 1 found in the current element
		ldr r3, =0 @Local Output, The #1's
		@R2 is the current element
		ldr r2,[r0]
		
		@ Checking all 32 bits
		InnerLoop: # for getting number of 1s
			AND r5, r2, r4 @checking if 0th to 31st bit one by one 
			LSL r4, r4 ,#1 @updating r4 to verify next bit
			cmp r5,#0 @if r5==0 then no need to update R3, which has number of 1s in the current number
			bne UpdateR3 @if R5 != 0 then need to increase R3 value by one
			b InnerLoopBreaker @Control will go to this when R5==0
	
	@End of Program		
	End:
		@End of program
		ldr r0, num @loading "num" add address in r0
		str r6, [r0] @Storing R6 value to "num" address
		ldr r0, weight @loading "weight" address in r0
		str r7, [r0] @Storing R7 value to "weight" address
		
		
		bx lr
		
	@when R5 != 0, R3 will be increase and we need to check then if we need to check if all 32 bits are verified or not ? then check if you new element has more number of bits set if yes Update else move to next element 
	UpdateR3:
		add r3, #1 
		b InnerLoopBreaker

	@ to verify if all 32 bits are verifiedd or not ? 
	@ when all 32 bits verification is done, then we need to verify if current element has more number of bits set then current max if yes Update else move to next element 	
	InnerLoopBreaker:
		cmp r4,#0x00000000
		bne InnerLoop
		beq updateMax
	
	@just to jump to next element
	@incase last element is exercised programe will End
	getNewElement:
		add r0,#4
		cmp r1,r0 @Checking for end of the loop
		bne Loop
		b End

	@verify if current element has more number of bits set then current max 
	updateMax:	
		cmp r7, r3
		blt updateNum
		b getNewElement
	
	@Update the current element as max and update R7 i.e. no of bits
	updateNum:
		ldr r6, [r0]
		mov r7, r3
		b getNewElement

	
first_data_items: .word data_start
last_data_items: .word data_end
num: .word NUM
weight: .word WEIGHT
