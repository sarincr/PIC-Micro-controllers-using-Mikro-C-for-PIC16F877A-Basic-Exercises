
_main:

;Base.c,1 :: 		void main()
;Base.c,3 :: 		TRISB = 0x00; //Makes PORTB0 or RB0 Output Pin
	CLRF       TRISB+0
;Base.c,5 :: 		while(1) //Infinite Loop
L_main0:
;Base.c,7 :: 		PORTB = 0x01; //LED ON
	MOVLW      1
	MOVWF      PORTB+0
;Base.c,8 :: 		Delay_ms(1000); //1 Second Delay
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
;Base.c,9 :: 		PORTB = 0x00; //LED OFF
	CLRF       PORTB+0
;Base.c,10 :: 		Delay_ms(1000); //1 Second Delay
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
;Base.c,11 :: 		}
	GOTO       L_main0
;Base.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
