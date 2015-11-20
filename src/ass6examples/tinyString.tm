* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyString.c-
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
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* EXPRESSION
 45:    LDC  3,65(6)	Load char constant 
 46:     ST  3,-4(1)	Store variable x
* EXPRESSION
  3:    LIT  "ant"
 47:    LDC  3,3(6)	Load literal value 
 48:    LDA  4,-6(1)	address of lhs 
 49:     LD  5,1(3)	size of rhs 
 50:     LD  6,1(4)	size of lhs 
 51:    SWP  5,6,6	pick smallest size 
 52:    MOV  4,3,5	array op = 
* EXPRESSION
 53:    LDC  3,66(6)	Load char constant 
 54:     ST  3,-2(1)	Store variable px
* EXPRESSION
  7:    LIT  "bat"
 55:    LDC  3,7(6)	Load literal value 
 56:    LDA  4,-3(1)	address of lhs 
 57:     LD  5,1(3)	size of rhs 
 58:     LD  6,1(4)	size of lhs 
 59:    SWP  5,6,6	pick smallest size 
 60:    MOV  4,3,5	array op = 
* EXPRESSION
 61:    LDC  3,67(6)	Load char constant 
 62:     ST  3,0(0)	Store variable gx
* EXPRESSION
 11:    LIT  "cat"
 63:    LDC  3,11(6)	Load literal value 
 64:    LDA  4,-2(0)	address of lhs 
 65:     LD  5,1(3)	size of rhs 
 66:     LD  6,1(4)	size of lhs 
 67:    SWP  5,6,6	pick smallest size 
 68:    MOV  4,3,5	array op = 
* EXPRESSION
 69:    LDC  3,68(6)	Load char constant 
 70:     ST  3,-12(0)	Store variable sx
* EXPRESSION
 15:    LIT  "dog"
 71:    LDC  3,15(6)	Load literal value 
 72:    LDA  4,-14(0)	address of lhs 
 73:     LD  5,1(3)	size of rhs 
 74:     LD  6,1(4)	size of lhs 
 75:    SWP  5,6,6	pick smallest size 
 76:    MOV  4,3,5	array op = 
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust fp 
 80:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,80(7)	Jump to init [backpatch] 
* INIT
 81:     LD  0,0(0)	Set the global pointer 
 82:    LDA  1,-24(0)	set first frame at end of globals 
 83:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 84:    LDC  3,10(6)	load size of array gy
 85:     ST  3,-1(0)	save size of array gy
 86:    LDC  3,10(6)	load size of array sy-2
 87:     ST  3,-13(0)	save size of array sy-2
* END INIT GLOBALS AND STATICS
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-48(7)	Jump to main 
 90:   HALT  0,0,0	DONE! 
* END INIT
