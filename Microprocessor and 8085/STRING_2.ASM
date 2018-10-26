;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : STRING_2.ASM
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
	MOV	CX,16
	CLD
REPNE	CMPSB
	DEC	SI
	DEC	DI
	;
	INT	3
	;
CODE	ENDS
	END


