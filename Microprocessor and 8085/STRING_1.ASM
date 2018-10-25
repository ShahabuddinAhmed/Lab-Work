;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : STRING_1.ASM
;     PROCESSOR : I8086
;*****************************************
	CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AX,0
	MOV	ES,AX
	;
	MOV	DI,2000H
	MOV	CX,16
	MOV	AL,11H
	CLD
REPNE	SCASB
	DEC	DI
	;
	INT	3
	;
CODE	ENDS
	END


