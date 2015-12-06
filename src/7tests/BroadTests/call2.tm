* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  call2.c-
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
* FUNCTION dog
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,444(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable a
* EXPRESSION
 45:    LDC  3,9(6)	Load integer constant 
 46:     ST  3,-4(1)	Save index 
 47:    LDC  3,555(6)	Load integer constant 
 48:     LD  4,-4(1)	Restore index 
 49:     LD  5,-3(1)	Load address of base of array b
 50:    SUB  5,5,4	Compute offset of value 
 51:     ST  3,0(5)	Store variable b
* RETURN
 52:     LD  3,-3(1)	Load address of base of array b
 53:     LD  3,1(3)	Load array size 
 54:    LDA  2,0(3)	Copy result to rt register 
 55:     LD  3,-1(1)	Load return address 
 56:     LD  1,0(1)	Adjust fp 
 57:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 58:    LDC  2,0(6)	Set return value to 0 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
 62:     ST  3,-1(1)	Store return address. 
* COMPOUND
 63:    LDC  3,10(6)	load size of array y
 64:     ST  3,-3(1)	save size of array y
* EXPRESSION
 65:    LDC  3,1(6)	Load Boolean constant 
 66:     ST  3,0(0)	Store variable g
* EXPRESSION
 67:    LDC  3,9(6)	Load integer constant 
 68:     ST  3,-14(1)	Save index 
 69:    LDC  3,0(6)	Load Boolean constant 
 70:     LD  4,-14(1)	Restore index 
 71:    LDA  5,-2(0)	Load address of base of array h
 72:    SUB  5,5,4	Compute offset of value 
 73:     ST  3,0(5)	Store variable h
* EXPRESSION
 74:    LDC  3,111(6)	Load integer constant 
 75:     ST  3,-2(1)	Store variable x
* EXPRESSION
 76:    LDC  3,9(6)	Load integer constant 
 77:     ST  3,-14(1)	Save index 
 78:    LDC  3,222(6)	Load integer constant 
 79:     LD  4,-14(1)	Restore index 
 80:    LDA  5,-4(1)	Load address of base of array y
 81:    SUB  5,5,4	Compute offset of value 
 82:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 83:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
 84:    LDC  3,333(6)	Load integer constant 
 85:     ST  3,-16(1)	Save left side 
*                       Begin call to  dog
 86:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 87:     LD  3,-2(1)	Load variable x
 88:     ST  3,-19(1)	Store parameter 
*                       Load param 2
 89:    LDA  3,-4(1)	Load address of base of array y
 90:     ST  3,-20(1)	Store parameter 
*                       Jump to dog
 91:    LDA  1,-17(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-52(7)	CALL dog
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
 95:     LD  4,-16(1)	Load left into ac1 
 96:    ADD  3,4,3	Op + 
 97:     ST  3,-16(1)	Store parameter 
*                       Jump to output
 98:    LDA  1,-14(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
102:    LDC  2,0(6)	Set return value to 0 
103:     LD  3,-1(1)	Load return address 
104:     LD  1,0(1)	Adjust fp 
105:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,105(7)	Jump to init [backpatch] 
* INIT
106:     LD  0,0(0)	Set the global pointer 
107:    LDA  1,-12(0)	set first frame at end of globals 
108:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
109:    LDC  3,10(6)	load size of array h
110:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-51(7)	Jump to main 
113:   HALT  0,0,0	DONE! 
* END INIT
