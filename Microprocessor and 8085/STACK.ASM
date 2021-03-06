;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : STACK.ASM
;     PROCESSOR : I8086
;*****************************************
	CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AX,0
	MOV	SS,AX
	MOV	SP,0540H
	;
	MOV	AX,1234H
	MOV	BX,5678H
	MOV	CX,3ABCH
	MOV	DX,0A0BH
	;
	PUSH	AX
	PUSH	BX
	PUSH	CX
	PUSH	DX
	;
	XCHG	AX,BX
	XCHG	BX,CX
	XCHG	CX,DX
	XCHG	DX,AX
	;
	POP	DX
	POP	CX
	POP	BX
	POP	AX
	;
	INT	3
	;
CODE	ENDS
	END


