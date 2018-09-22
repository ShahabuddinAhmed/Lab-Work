;*****************************************
;     MDA-Win8086 EXPERIMENT PROGRAM    *
;     FILENAME  : D8251A_1.ASM
;     PROCESSOR : I8086
;     Echo back program (Interrupt)
;*****************************************	
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
INTA		EQU	10H
INTA2		EQU	INTA+2
		;
INT_V		EQU	43H*4

STACK		EQU	540H
		;
		ORG	1000H
		XOR	AX,AX
		MOV	SS,AX
		MOV	DS,AX
		MOV	ES,AX
		MOV	SP,STACK
		;
		MOV	AX,OFFSET INT_SER
		MOV	BX,INT_V
		MOV	WORD PTR ES:[BX],AX
		;
		XOR	AX,AX
		MOV	WORD PTR ES:[BX+2],AX
		;
		CALL	I8259
		CALL	I8253	; initialize and setup 8253
		CALL	I8251   ; initialize 8251
		;
		IN	AL,SIO_D	
		STI
L2:		NOP
		JMP	L2		
		;
INT_SER:	IN	AL,SIO_C	; get status
		TEST	AL,02H		; tx(receive ready)?
		JNZ	RX_D		; no, wait until ready
		;
		TEST	AL,01H          ; rx
		JNZ	TX_D
		;  EOI command
INTR:		MOV	AL,00100000B
		OUT	INTA,AL
		STI
		IRET	
		;
RX_D:		IN	AL,SIO_D	; get data
		AND	AL,7FH		; clear MSB
		;
		MOV	BYTE PTR BUFF,AL
		;
		MOV	AL,0FFH
		MOV	BYTE PTR R_FLAG,AL
		JMP	INTR
		;
TX_D:		MOV	AL,BYTE PTR R_FLAG
		CMP	AL,0FFH
		JNE	INTR
		;
		MOV	AL,BYTE PTR BUFF ; yes, character to be output
		OUT	SIO_D,AL ; output character
		;
		XOR	AL,AL
		MOV	BYTE PTR R_FLAG,AL
		JMP	INTR
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

I8259		PROC	NEAR
		; ICW1
 		MOV	AL,00011011B
		OUT	INTA,AL
		;ICW2 interrupt vector
		MOV	AL,40H
		OUT	INTA2,AL
		;ICW4
		MOV	AL,00000001B
		OUT	INTA2,AL
		; IR3 enable
		MOV 	AL,11110111B
		OUT	INTA2,AL
		RET
I8259		ENDP
		;	
BUFF:		DB	1
		;
R_FLAG:		DB	1
		;
CODE		ENDS
		END
		


