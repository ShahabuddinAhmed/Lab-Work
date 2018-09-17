;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : BIT_3.ASM
;     PROCESSOR : I8086
;*****************************************
	CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AX,0
	MOV	DS,AX
	;
	MOV	DL,4
	MOV	SI,2000H
	;
L1:	MOV	AL,[SI+6]
	RCL	AL,1
	MOV	BX,SI
	MOV	CX,7
L2:	RCL	BYTE PTR[SI+0],1
	INC	SI
	LOOP	L2
	;
	MOV	SI,BX
	DEC	DL
	JNZ	L1
	;
	INT	3
	;
CODE	ENDS
	END



