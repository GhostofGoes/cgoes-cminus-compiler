* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  s03.c-
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
 43:    LDC  3,10(6)	load size of array cat
 44:     ST  3,-2(1)	save size of array cat
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
 46:    LDA  3,-3(1)	Load address of base of array cat
 47:     LD  3,1(3)	Load array size 
 48:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 49:    LDA  1,-13(1)	Load address of new frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    LDA  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 53:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
 54:    LDA  3,-1(0)	Load address of base of array dog
 55:     LD  3,1(3)	Load array size 
 56:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 57:    LDA  1,-13(1)	Load address of new frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    LDA  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 61:    LDC  2,0(6)	Set return value to 0 
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,64(7)	Jump to init [backpatch] 
* INIT
 65:     LD  0,0(0)	Set the global pointer 
 66:    LDA  1,-11(0)	set first frame at end of globals 
 67:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 68:    LDC  3,10(6)	load size of array dog-1
 69:     ST  3,0(0)	save size of array dog-1
* END INIT GLOBALS AND STATICS
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-30(7)	Jump to main 
 72:   HALT  0,0,0	DONE! 
* END INIT
