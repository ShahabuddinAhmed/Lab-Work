;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : MATRIX_2.ASM
;     PROCESSOR : I8086
;     DOT MATRIX TEST
;*****************************************
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	;
PPIC_C	EQU	1EH ; control register
PPIC	EQU	1CH ; c port
PPIB	EQU	1AH
PPIA	EQU	18H
	;	
	ORG	1000H
	MOV	AL,10000000B
	OUT	PPIC_C,AL
	;
	MOV	AL,11111111B
	OUT	PPIA,AL
	;
L1:	MOV	SI,OFFSET FONT
	;
	MOV	AH,00000001B
	;
L2:	MOV	AL,BYTE PTR CS:[SI]
	OUT	PPIB,AL
	;		
	MOV	AL,AH
	OUT	PPIC,AL
	CALL	TIMER
	INC	SI
	CLC
	ROL	AH,1
	JNC	L2
	JMP	L1		
	;
	INT	3
	;		
TIMER:	MOV	CX,300
TIMER1:	NOP
	NOP
	NOP
	NOP
	LOOP	TIMER1
	RET
	;
FONT:   DB      11111111B
        DB      11111111B
        DB      11000011B
        DB      10111101B
        DB      01111110B
        DB      01111111B
        DB      11111111B
        DB      11111111B


FONT1:   DB      11111111B
        DB      11111111B
        DB      00001110B
        DB      01101110B
        DB      01101110B
        DB      01100000B
        DB      11111111B
        DB      11111111B


FONT2:   DB      11111111B
        DB      11111111B
        DB      00000000B
        DB      01101110B
        DB      01101110B
        DB      01101110B
        DB      11111111B
        DB      11111111B

CODE	ENDS
	END


