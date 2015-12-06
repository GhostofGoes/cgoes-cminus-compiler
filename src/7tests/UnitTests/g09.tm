* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  g09.c-
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
* RETURN
 43:    LDC  3,77(6)	Load integer constant 
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,-3(1)	Load variable x
 46:     LD  4,-2(1)	Load address of base of array z
 47:    SUB  3,4,3	Compute offset of value 
 48:     LD  3,0(3)	Load the value 
 49:     ST  3,-5(1)	Save left side 
 50:     LD  3,-3(1)	Load variable x
 51:     LD  4,-2(1)	Load address of base of array z
 52:    SUB  3,4,3	Compute offset of value 
 53:     LD  3,0(3)	Load the value 
 54:     LD  4,-5(1)	Load left into ac1 
 55:    MUL  3,4,3	Op * 
 56:     LD  4,-4(1)	Load left into ac1 
 57:    ADD  3,4,3	Op + 
 58:    LDA  2,0(3)	Copy result to rt register 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 62:    LDC  2,0(6)	Set return value to 0 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 66:     ST  3,-1(1)	Store return address. 
* COMPOUND
 67:    LDC  3,10(6)	load size of array z
 68:     ST  3,-2(1)	save size of array z
* EXPRESSION
 69:    LDC  3,3(6)	Load integer constant 
 70:     ST  3,-13(1)	Save index 
 71:    LDC  3,445(6)	Load integer constant 
 72:     LD  4,-13(1)	Restore index 
 73:    LDA  5,-3(1)	Load address of base of array z
 74:    SUB  5,5,4	Compute offset of value 
 75:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  output
 76:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
 77:     ST  1,-15(1)	Store old fp in ghost frame 
*                       Load param 1
 78:    LDA  3,-3(1)	Load address of base of array z
 79:     ST  3,-17(1)	Store parameter 
*                       Load param 2
 80:    LDC  3,3(6)	Load integer constant 
 81:     ST  3,-18(1)	Store parameter 
*                       Jump to cat
 82:    LDA  1,-15(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-43(7)	CALL cat
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 86:     ST  3,-15(1)	Save left side 
 87:    LDC  3,100(6)	Load integer constant 
 88:     LD  4,-15(1)	Load left into ac1 
 89:    DIV  5,4,3	Op % 
 90:    MUL  5,5,3	 
 91:    SUB  3,4,5	 
 92:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-13(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,100(7)	Jump to init [backpatch] 
* INIT
101:     LD  0,0(0)	Set the global pointer 
102:    LDA  1,0(0)	set first frame at end of globals 
103:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-40(7)	Jump to main 
106:   HALT  0,0,0	DONE! 
* END INIT
