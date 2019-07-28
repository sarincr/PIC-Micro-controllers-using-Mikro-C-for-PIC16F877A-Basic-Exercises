
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,3 :: 		TRISB.F0 = 0; //Makes PORTB0 or RB0 Output Pin
	BCF        TRISB+0, 0
;MyProject.c,5 :: 		while(1) //Infinite Loop
L_main0:
;MyProject.c,7 :: 		PORTB.F0 = 1; //LED ON
	BSF        PORTB+0, 0
;MyProject.c,8 :: 		Delay_ms(1000); //1 Second Delay
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,9 :: 		PORTB.F0 = 0; //LED OFF
	BCF        PORTB+0, 0
;MyProject.c,10 :: 		Delay_ms(1000); //1 Second Delay
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject.c,11 :: 		}
	GOTO       L_main0
;MyProject.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
