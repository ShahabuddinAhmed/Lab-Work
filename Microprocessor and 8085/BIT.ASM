;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : BIT.ASM
;     PROCESSOR : I8086
;*****************************************
	CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
	ORG	1000H
	MOV	AL,01011010B
	AND	AL,11110000B
	OR	AL,00001010B
	XOR	AL,01011111B
	NOT	AL
	INC	AL
	;
	MOV	BX,39ABH
	MOV	AL,BL
	OR	AL,0FH
	AND	AL,BH
	;
	AND	BL,0FH
	OR	AL,BL
	;
	INT	3
	;
CODE	ENDS
	END


