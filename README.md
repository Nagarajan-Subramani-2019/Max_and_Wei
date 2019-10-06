# CS6620: Advanced Computer Organization and Architecture with Lab
# Lab Assignment-3 

## Finding the 32-bit number that has the largest Weight (Submission Deadline:13/10/19)

__Weight__ of a 32-bit number is defined as __the total number of bits set__.

Given a series of 32-bit numbers (in hexadecimal form), write and assembly program to determine which element ,in the series, has the largest weight and store the number in __NUM__ and its weight in __WIEGHT__.

Assume that the memory locations starting at address ___data_start___ contains the give set of integers. 

For example, the *.data* section will look like
```
data_start: 0x205A15E3 ;(0010 0000 0101 1010 0001 0101 1101 0011 – 13)
            0x256C8700 ;(0010 0101 0110 1100 1000 0111 0000 0000 – 11)
data_end:   0x295468F2 ;(0010 1001 0101 0100 0110 1000 1111 0010 – 14)

Output: NUM     295468F2
        WEIGHT  14
```

Add necessary comments to your program for easy readability.

The starter file is given in this repository
