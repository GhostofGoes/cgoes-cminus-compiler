* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  h06.c-
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
* IF
 43:     LD  3,-3(1)	Load variable y
 44:     ST  3,-4(1)	Save left side 
 45:    LDC  3,0(6)	Load integer constant 
 46:     LD  4,-4(1)	Load left into ac1 
 47:    TGE  3,4,3	Op >= 
* THEN
* COMPOUND
* EXPRESSION
 49:     LD  3,-3(1)	Load variable y
 50:     ST  3,-4(1)	Save index 
 51:     LD  3,-3(1)	Load variable y
 52:     LD  4,-4(1)	Restore index 
 53:     LD  5,-2(1)	Load address of base of array x
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
 56:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 57:     LD  3,-2(1)	Load address of base of array x
 58:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 59:     LD  3,-3(1)	Load variable y
 60:     ST  3,-7(1)	Save left side 
 61:    LDC  3,1(6)	Load integer constant 
 62:     LD  4,-7(1)	Load left into ac1 
 63:    SUB  3,4,3	Op - 
 64:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
 65:    LDA  1,-4(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-26(7)	CALL cat
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
 48:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 72:    LDC  2,0(6)	Set return value to 0 
 73:     LD  3,-1(1)	Load return address 
 74:     LD  1,0(1)	Adjust fp 
 75:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 76:     ST  3,-1(1)	Store return address. 
* COMPOUND
 77:    LDC  3,18(6)	load size of array x
 78:     ST  3,-2(1)	save size of array x
* EXPRESSION
 79:    LDC  3,12(6)	Load integer constant 
 80:     ST  3,-21(1)	Store variable y
* EXPRESSION
*                       Begin call to  cat
 81:     ST  1,-22(1)	Store old fp in ghost frame 
*                       Load param 1
 82:    LDA  3,-3(1)	Load address of base of array x
 83:     ST  3,-24(1)	Store parameter 
*                       Load param 2
 84:     LD  3,-21(1)	Load variable y
 85:     ST  3,-25(1)	Store parameter 
*                       Jump to cat
 86:    LDA  1,-22(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-47(7)	CALL cat
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* WHILE
 90:     LD  3,-21(1)	Load variable y
 91:     ST  3,-22(1)	Save left side 
 92:    LDC  3,0(6)	Load integer constant 
 93:     LD  4,-22(1)	Load left into ac1 
 94:    TGE  3,4,3	Op >= 
 95:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-22(1)	Store old fp in ghost frame 
*                       Load param 1
 98:     LD  3,-21(1)	Load variable y
 99:     ST  3,-24(1)	Store parameter 
*                       Jump to output
100:    LDA  1,-22(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
104:     ST  1,-22(1)	Store old fp in ghost frame 
*                       Jump to outnl
105:    LDA  1,-22(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-71(7)	CALL outnl
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
109:     LD  3,-21(1)	Load variable y
110:     ST  3,-22(1)	Save left side 
111:    LDC  3,1(6)	Load integer constant 
112:     LD  4,-22(1)	Load left into ac1 
113:    SUB  3,4,3	Op - 
114:     ST  3,-21(1)	Store variable y
* END COMPOUND
115:    LDA  7,-26(7)	go to beginning of loop 
 96:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
116:    LDC  2,0(6)	Set return value to 0 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,119(7)	Jump to init [backpatch] 
* INIT
120:     LD  0,0(0)	Set the global pointer 
121:    LDA  1,0(0)	set first frame at end of globals 
122:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-49(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
