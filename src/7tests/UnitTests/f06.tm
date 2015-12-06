* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  f06.c-
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
 43:    LDC  3,1(6)	Load Boolean constant 
 44:    LDA  2,0(3)	Copy result to rt register 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust fp 
 47:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  cat
 53:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to cat
 54:    LDA  1,-3(1)	Load address of new frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    LDA  7,-15(7)	CALL cat
 57:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 58:     ST  3,-3(1)	Save left side 
 59:    LDC  3,0(6)	Load Boolean constant 
 60:     LD  4,-3(1)	Load left into ac1 
 61:    AND  3,4,3	Op AND 
 62:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  outputb
 63:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 64:     LD  3,-2(1)	Load variable x
 65:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
 66:    LDA  1,-3(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-51(7)	CALL outputb
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  cat
 70:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to cat
 71:    LDA  1,-3(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-32(7)	CALL cat
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 75:     ST  3,-3(1)	Save left side 
 76:    LDC  3,0(6)	Load Boolean constant 
 77:     LD  4,-3(1)	Load left into ac1 
 78:     OR  3,4,3	Op OR 
 79:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  outputb
 80:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 81:     LD  3,-2(1)	Load variable x
 82:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
 83:    LDA  1,-3(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-68(7)	CALL outputb
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  cat
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to cat
 88:    LDA  1,-3(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-49(7)	CALL cat
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 92:    LDC  4,1(6)	Load 1 
 93:    XOR  3,3,4	Op NOT 
 94:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  outputb
 95:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 96:     LD  3,-2(1)	Load variable x
 97:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
 98:    LDA  1,-3(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-83(7)	CALL outputb
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
102:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
103:    LDA  1,-3(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-69(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
107:    LDC  2,0(6)	Set return value to 0 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,110(7)	Jump to init [backpatch] 
* INIT
111:     LD  0,0(0)	Set the global pointer 
112:    LDA  1,0(0)	set first frame at end of globals 
113:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-64(7)	Jump to main 
116:   HALT  0,0,0	DONE! 
* END INIT
