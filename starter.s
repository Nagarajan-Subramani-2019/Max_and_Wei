


/******************************************************************************
* file: starter.s
* author: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  This is the starter code for assignment 2
  */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
data_start: 0x205A15E3 ;(0010 0000 0101 1010 0001 0101 1101 0011 – 13)
            0x256C8700 ;(0010 0101 0110 1100 1000 0111 0000 0000 – 11)
data_end:   0x295468F2 ;(0010 1001 0101 0100 0110 1000 1111 0010 – 14)

Output: NUM     295468F2
        WEIGHT  14

  @ TEXT section
      .text

.globl _main


_main:

      

        @ you can write your own code here
