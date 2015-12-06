* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  examplearray3.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,9999(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable q
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 46:    LDC  3,1(6)	Load integer constant 
 47:     LD  4,-2(1)	Load address of base of array x
 48:    SUB  3,4,3	Compute offset of value 
 49:     LD  3,0(3)	Load the value 
 50:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-4(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6)	Set return value to 0 
 56:     LD  3,-1(1)	Load return address 
 57:     LD  1,0(1)	Adjust fp 
 58:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION dog
 59:     ST  3,-1(1)	Store return address. 
* COMPOUND
 60:    LDC  3,9999(6)	Load integer constant 
 61:     ST  3,-3(1)	Store variable q
* EXPRESSION
*                       Begin call to  cat
 62:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 63:     LD  3,-2(1)	Load address of base of array y
 64:     ST  3,-6(1)	Store parameter 
*                       Jump to cat
 65:    LDA  1,-4(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-26(7)	CALL cat
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
 73:     ST  3,-1(1)	Store return address. 
* COMPOUND
 74:    LDC  3,9999(6)	Load integer constant 
 75:     ST  3,-2(1)	Store variable q
 76:    LDC  3,10(6)	load size of array z
 77:     ST  3,-3(1)	save size of array z
* EXPRESSION
 78:    LDC  3,1(6)	Load integer constant 
 79:     ST  3,-14(1)	Save index 
 80:    LDC  3,777(6)	Load integer constant 
 81:     LD  4,-14(1)	Restore index 
 82:    LDA  5,-4(1)	Load address of base of array z
 83:    SUB  5,5,4	Compute offset of value 
 84:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  dog
 85:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
 86:    LDA  3,-4(1)	Load address of base of array z
 87:     ST  3,-16(1)	Store parameter 
*                       Jump to dog
 88:    LDA  1,-14(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-32(7)	CALL dog
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust fp 
 95:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,95(7)	Jump to init [backpatch] 
* INIT
 96:     LD  0,0(0)	Set the global pointer 
 97:    LDA  1,0(0)	set first frame at end of globals 
 98:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-28(7)	Jump to main 
101:   HALT  0,0,0	DONE! 
* END INIT
