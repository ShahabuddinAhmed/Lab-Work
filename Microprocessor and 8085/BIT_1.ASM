;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : BIT_1.ASM
;     PROCESSOR : I8086
;*****************************************
	CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AX,1234H
	MOV	BX,5678H
	MOV	CX,0ABCDH
	MOV	DX,0EF07H
	;
	SHL	DX,1
	RCL	CX,1
	RCL	BX,1
	RCL	AX,1
	;
	INT	3
	;
CODE	ENDS
	END


