* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyInit.c-
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    LDA  7,0(3)	Return 
* END FUNCTION input
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:    LDC  2,0(6)	Set return to 0 
 10:     LD  3,-1(1)	Load return address 
 11:     LD  1,0(1)	Adjust fp 
 12:    LDA  7,0(3)	Return 
* END FUNCTION output
* FUNCTION inputb
 13:     ST  3,-1(1)	Store return address 
 14:    INB  2,2,2	Grab bool input 
 15:     LD  3,-1(1)	Load return address 
 16:     LD  1,0(1)	Adjust fp 
 17:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* FUNCTION outputb
 18:     ST  3,-1(1)	Store return address 
 19:     LD  3,-2(1)	Load parameter 
 20:   OUTB  3,3,3	Output bool 
 21:    LDC  2,0(6)	Set return to 0 
 22:     LD  3,-1(1)	Load return address 
 23:     LD  1,0(1)	Adjust fp 
 24:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* FUNCTION inputc
 25:     ST  3,-1(1)	Store return address 
 26:    INC  2,2,2	Grab char input 
 27:     LD  3,-1(1)	Load return address 
 28:     LD  1,0(1)	Adjust fp 
 29:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* FUNCTION outputc
 30:     ST  3,-1(1)	Store return address 
 31:     LD  3,-2(1)	Load parameter 
 32:   OUTC  3,3,3	Output char 
 33:    LDC  2,0(6)	Set return to 0 
 34:     LD  3,-1(1)	Load return address 
 35:     LD  1,0(1)	Adjust fp 
 36:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* FUNCTION outnl
 37:     ST  3,-1(1)	Store return address 
 38:  OUTNL  3,3,3	Output a newline 
 39:     LD  3,-1(1)	Load return address 
 40:     LD  1,0(1)	Adjust fp 
 41:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* FUNCTION main
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,22(6)	load size of array b
 44:     ST  3,-2(1)	save size of array b
 45:    LDC  3,777(6)	Load integer constant 
 46:     ST  3,-25(1)	Store variable y
* EXPRESSION
 47:    LDC  3,999(6)	Load integer constant 
 48:     ST  3,-47(0)	Store variable z
* END COMPOUND
* Add standard closing in case there is no return statement
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust fp 
 52:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,52(7)	Jump to init [backpatch] 
* INIT
 53:     LD  0,0(0)	Set the global pointer 
 54:    LDA  1,-48(0)	set first frame at end of globals 
 55:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 56:    LDC  3,11(6)	load size of array a
 57:     ST  3,0(0)	save size of array a
 58:    LDC  3,33(6)	load size of array c-1
 59:     ST  3,-13(0)	save size of array c-1
 60:    LDC  3,666(6)	Load integer constant 
 61:     ST  3,-12(0)	Store variable x
 62:    LDC  3,888(6)	Load integer constant 
 63:     ST  3,-47(0)	Store variable z-2
* END INIT GLOBALS AND STATICS
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-24(7)	Jump to main 
 66:   HALT  0,0,0	DONE! 
* END INIT
