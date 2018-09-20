;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : D8251A.ASM
;     PROCESSOR : I8086
;     Echo back program (Polling)
;*****************************************
        ;
CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE
		;
SIO_D		EQU	08H	; 8251 data address
SIO_C		EQU	0AH	; 8251 control address
SIO_MODE 	EQU 	4EH	; 8251 mode byte
SIO_COMMAND	EQU	27H		
		;
PCT		EQU	09H	; 8253 counter 0 address
PCTCTL		EQU	0FH	; 8253 control address
		;
STACK		EQU	540H
		;
		ORG	1000H
		XOR	AX,AX
		MOV	SS,AX
		MOV	SP,STACK
		;
		CALL	I8253	; initialize and setup 8253
		CALL	I8251   ; initialize 8251
		;
ECHO:		CALL	IN8251
		MOV	AH,AL
		CALL	OUT8251
		MOV	AL,AH
		JMP	ECHO
; ----- [ initialize and setup 8253 ] -----;
I8253:		MOV 	AL,36H		; get mode type
		OUT	PCTCTL,AL	; set it
		MOV	AX,16		; time constant
		OUT	PCT,AL		; set LCB of time constant
		MOV	AL,AH		;     &
		OUT 	PCT,AL		; set MCF of time constant
		RET
; ----- [ initialize and setup 8251 ] -----;
I8251:		MOV	AL,40H
		OUT	SIO_C,AL		; 8251 known state
		MOV	CX,10
DEL1:		LOOP	DEL1
		;
		MOV	AH,3
DEL3:		MOV	AL,0
		OUT	SIO_C,AL
		MOV	CX,10
DEL2:		LOOP	DEL2
		DEC	AH
		JNZ	DEL3
		;				
		MOV	AL,40H		; reset 8251
		OUT	SIO_C,AL
		MOV	CX,10
DEL5:		LOOP	DEL5
		;		
		MOV	AL,SIO_MODE	; mode byte
		OUT	SIO_C,AL
		MOV	CX,10
DEL6:		LOOP	DEL6
		;		
		MOV	AL,SIO_COMMAND	; command to 8251
		OUT	SIO_C,AL
		MOV	CX,10
DEL7:		LOOP	DEL7
		;
		RET
; ----- [ send character thru 8251 CHAR = AH] -----;
OUT8251:	IN	AL,SIO_C ; input status
		AND	AL,01H	 ; tx(transmit ready)?
		JZ	OUT8251	 ; no, wait until ready
		MOV	AL,AH	 ; yes, character to be output
		OUT	SIO_D,AL ; output character
		RET
; ----- [ input a character into AL thru 8251 ] -----;
IN8251:		IN	AL,SIO_C	; get status
		AND	AL,02H		; rv(receive ready)?
		JZ	IN8251		; no, wait until ready
		IN	AL,SIO_D	; get data
		AND	AL,7FH		; clear MSB
		RET
		;
CODE		ENDS
		END
		

