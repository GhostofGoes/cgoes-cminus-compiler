* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  control2.c-
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
* EXPRESSION
 43:    LDC  3,10(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
 45:    LDC  3,7(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable y
* WHILE
 47:     LD  3,-2(1)	Load variable x
 48:     ST  3,-4(1)	Save left side 
 49:    LDC  3,0(6)	Load integer constant 
 50:     LD  4,-4(1)	Load left into ac1 
 51:    TGT  3,4,3	Op > 
 52:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
 54:     LD  3,-2(1)	Load variable x
 55:     ST  3,-4(1)	Save left side 
 56:     LD  3,-3(1)	Load variable y
 57:     LD  4,-4(1)	Load left into ac1 
 58:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
 60:    LDC  3,666(6)	Load integer constant 
 61:     ST  3,-3(1)	Store variable y
 59:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 63:     LD  3,-2(1)	Load variable x
 64:     ST  3,-4(1)	Save left side 
 65:    LDC  3,1(6)	Load integer constant 
 66:     LD  4,-4(1)	Load left into ac1 
 67:    SUB  3,4,3	Op - 
 68:     ST  3,-2(1)	Store variable x
 62:    LDA  7,6(7)	Jump around the ELSE [backpatch] 
* ENDIF
 69:    LDA  7,-23(7)	go to beginning of loop 
 53:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
 70:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 71:     LD  3,-3(1)	Load variable y
 72:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 73:    LDA  1,-4(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 77:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 78:    LDA  1,-4(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-44(7)	CALL outnl
 81:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 82:    LDC  3,1(6)	Load integer constant 
 83:     ST  3,-2(1)	Store variable x
* EXPRESSION
 84:    LDC  3,1(6)	Load integer constant 
 85:     ST  3,-3(1)	Store variable y
* WHILE
 86:     LD  3,-2(1)	Load variable x
 87:     ST  3,-4(1)	Save left side 
 88:    LDC  3,5(6)	Load integer constant 
 89:     LD  4,-4(1)	Load left into ac1 
 90:    TLT  3,4,3	Op < 
 91:    JNZ  3,1(7)	Jump to while part 
* DO
* IF
 93:     LD  3,-3(1)	Load variable y
 94:     ST  3,-4(1)	Save left side 
 95:    LDC  3,5(6)	Load integer constant 
 96:     LD  4,-4(1)	Load left into ac1 
 97:    TLT  3,4,3	Op < 
* THEN
* WHILE
 99:     LD  3,-3(1)	Load variable y
100:     ST  3,-4(1)	Save left side 
101:    LDC  3,5(6)	Load integer constant 
102:     LD  4,-4(1)	Load left into ac1 
103:    TLT  3,4,3	Op < 
104:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
106:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
107:     LD  3,-2(1)	Load variable x
108:     ST  3,-6(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-4(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
113:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
114:     LD  3,-3(1)	Load variable y
115:     ST  3,-6(1)	Store parameter 
*                       Jump to output
116:    LDA  1,-4(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
120:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
121:    LDA  1,-4(1)	Load address of new frame 
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-87(7)	CALL outnl
124:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
125:     LD  3,-3(1)	load lhs variable y
126:    LDA  3,1(3)	increment value of y
127:     ST  3,-3(1)	Store variable y
* END COMPOUND
128:    LDA  7,-30(7)	go to beginning of loop 
105:    LDA  7,23(7)	Jump past loop [backpatch] 
* ENDWHILE
 98:    JZR  3,31(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
130:    LDC  3,1(6)	Load integer constant 
131:     ST  3,-3(1)	Store variable y
* EXPRESSION
132:     LD  3,-2(1)	load lhs variable x
133:    LDA  3,1(3)	increment value of x
134:     ST  3,-2(1)	Store variable x
* END COMPOUND
129:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
135:    LDA  7,-50(7)	go to beginning of loop 
 92:    LDA  7,43(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
136:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
137:     LD  3,-2(1)	Load variable x
138:     ST  3,-6(1)	Store parameter 
*                       Jump to output
139:    LDA  1,-4(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-136(7)	CALL output
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
143:     LD  3,-1(1)	Load return address 
144:     LD  1,0(1)	Adjust fp 
145:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
146:    LDC  2,0(6)	Set return value to 0 
147:     LD  3,-1(1)	Load return address 
148:     LD  1,0(1)	Adjust fp 
149:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,149(7)	Jump to init [backpatch] 
* INIT
150:     LD  0,0(0)	Set the global pointer 
151:    LDA  1,0(0)	set first frame at end of globals 
152:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-113(7)	Jump to main 
155:   HALT  0,0,0	DONE! 
* END INIT
