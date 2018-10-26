;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : STRING.ASM
;     PROCESSOR : I8086
;*****************************************
	CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AX,0
	MOV	DS,AX
	MOV	ES,AX
	;
	MOV	SI,2000H
	MOV	DI,2100H
	MOV	CX,8
	CLD
L1:	MOVSW
	LOOP	L1
	;
	INT	3
	;
CODE	ENDS
	END



