;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : BRANCH_1.ASM
;     PROCESSOR : I8086
;*****************************************
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AX,00H
	MOV	DS,AX
	;
	MOV	SI,2000H
	MOV	CX,0100H
L1:	MOV	[SI],AL
	INC	SI
	LOOP	L1
	;
	INT	3
	;
CODE	ENDS
	END

	

