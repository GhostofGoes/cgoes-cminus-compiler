* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  combslow.c-
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
* FUNCTION comb
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-2(1)	Load variable a
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,-3(1)	Load variable b
 46:     LD  4,-4(1)	Load left into ac1 
 47:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 49:    LDC  3,1(6)	Load integer constant 
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
 48:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 54:     LD  3,-3(1)	Load variable b
 55:     ST  3,-4(1)	Save left side 
 56:    LDC  3,0(6)	Load integer constant 
 57:     LD  4,-4(1)	Load left into ac1 
 58:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 60:    LDC  3,1(6)	Load integer constant 
 61:    LDA  2,0(3)	Copy result to rt register 
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    LDA  7,0(3)	Return 
 59:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 65:     LD  3,-3(1)	Load variable b
 66:     ST  3,-4(1)	Save left side 
 67:    LDC  3,1(6)	Load integer constant 
 68:     LD  4,-4(1)	Load left into ac1 
 69:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 71:     LD  3,-2(1)	Load variable a
 72:    LDA  2,0(3)	Copy result to rt register 
 73:     LD  3,-1(1)	Load return address 
 74:     LD  1,0(1)	Adjust fp 
 75:    LDA  7,0(3)	Return 
 70:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
*                       Begin call to  comb
 76:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 77:     LD  3,-2(1)	Load variable a
 78:     ST  3,-6(1)	Save left side 
 79:    LDC  3,1(6)	Load integer constant 
 80:     LD  4,-6(1)	Load left into ac1 
 81:    SUB  3,4,3	Op - 
 82:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 83:     LD  3,-3(1)	Load variable b
 84:     ST  3,-7(1)	Save left side 
 85:    LDC  3,1(6)	Load integer constant 
 86:     LD  4,-7(1)	Load left into ac1 
 87:    SUB  3,4,3	Op - 
 88:     ST  3,-7(1)	Store parameter 
*                       Jump to comb
 89:    LDA  1,-4(1)	Load address of new frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    LDA  7,-50(7)	CALL comb
 92:    LDA  3,0(2)	Save the result in ac 
*                       End call to comb
 93:     ST  3,-4(1)	Save left side 
*                       Begin call to  comb
 94:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 95:     LD  3,-2(1)	Load variable a
 96:     ST  3,-7(1)	Save left side 
 97:    LDC  3,1(6)	Load integer constant 
 98:     LD  4,-7(1)	Load left into ac1 
 99:    SUB  3,4,3	Op - 
100:     ST  3,-7(1)	Store parameter 
*                       Load param 2
101:     LD  3,-3(1)	Load variable b
102:     ST  3,-8(1)	Store parameter 
*                       Jump to comb
103:    LDA  1,-5(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-64(7)	CALL comb
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to comb
107:     LD  4,-4(1)	Load left into ac1 
108:    ADD  3,4,3	Op + 
109:    LDA  2,0(3)	Copy result to rt register 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    LDA  7,0(3)	Return 
* END FUNCTION comb
* FUNCTION main
117:     ST  3,-1(1)	Store return address. 
* COMPOUND
* WHILE
118:    LDC  3,1(6)	Load Boolean constant 
119:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  input
121:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
122:    LDA  1,-5(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-124(7)	CALL input
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
126:     ST  3,-4(1)	Store variable n
127:     ST  3,-5(1)	Save left side 
128:    LDC  3,0(6)	Load integer constant 
129:     LD  4,-5(1)	Load left into ac1 
130:    TEQ  3,4,3	Op == 
* THEN
* BREAK
132:    LDA  7,-13(7)	break 
131:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
133:    LDC  3,0(6)	Load integer constant 
134:     ST  3,-2(1)	Store variable a
* WHILE
135:     LD  3,-2(1)	Load variable a
136:     ST  3,-5(1)	Save left side 
137:     LD  3,-4(1)	Load variable n
138:     LD  4,-5(1)	Load left into ac1 
139:    TLE  3,4,3	Op <= 
140:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
142:    LDC  3,0(6)	Load integer constant 
143:     ST  3,-3(1)	Store variable b
* WHILE
144:     LD  3,-3(1)	Load variable b
145:     ST  3,-5(1)	Save left side 
146:     LD  3,-2(1)	Load variable a
147:     LD  4,-5(1)	Load left into ac1 
148:    TLE  3,4,3	Op <= 
149:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
151:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  comb
152:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
153:     LD  3,-2(1)	Load variable a
154:     ST  3,-9(1)	Store parameter 
*                       Load param 2
155:     LD  3,-3(1)	Load variable b
156:     ST  3,-10(1)	Store parameter 
*                       Jump to comb
157:    LDA  1,-7(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-118(7)	CALL comb
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to comb
161:     ST  3,-7(1)	Store parameter 
*                       Jump to output
162:    LDA  1,-5(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-159(7)	CALL output
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
166:     LD  3,-3(1)	load lhs variable b
167:    LDA  3,1(3)	increment value of b
168:     ST  3,-3(1)	Store variable b
* END COMPOUND
169:    LDA  7,-26(7)	go to beginning of loop 
150:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
170:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
171:    LDA  1,-5(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-137(7)	CALL outnl
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
175:     LD  3,-2(1)	load lhs variable a
176:    LDA  3,1(3)	increment value of a
177:     ST  3,-2(1)	Store variable a
* END COMPOUND
178:    LDA  7,-44(7)	go to beginning of loop 
141:    LDA  7,37(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
179:    LDA  7,-62(7)	go to beginning of loop 
120:    LDA  7,59(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
180:    LDC  2,0(6)	Set return value to 0 
181:     LD  3,-1(1)	Load return address 
182:     LD  1,0(1)	Adjust fp 
183:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,183(7)	Jump to init [backpatch] 
* INIT
184:     LD  0,0(0)	Set the global pointer 
185:    LDA  1,0(0)	set first frame at end of globals 
186:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-72(7)	Jump to main 
189:   HALT  0,0,0	DONE! 
* END INIT
