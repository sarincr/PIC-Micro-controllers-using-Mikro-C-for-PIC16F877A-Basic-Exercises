
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,3 :: 		TRISB = 0 ;     // set PORTB as OUTPUT
	CLRF       TRISB+0
;MyProject.c,5 :: 		for(;;)         // forever
L_main0:
;MyProject.c,7 :: 		PORTB.B0 = 1 ;          // turn LEDs ON
	BSF        PORTB+0, 0
;MyProject.c,8 :: 		PORTB.B1 = 0 ;          // turn LEDs OFF
	BCF        PORTB+0, 1
;MyProject.c,9 :: 		Delay_ms(500) ;         // wait 500 ms
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;MyProject.c,10 :: 		PORTB.B0 = 0 ;          // turn LEDs ON
	BCF        PORTB+0, 0
;MyProject.c,11 :: 		PORTB.B1 =1 ;          // turn LEDs OFF
	BSF        PORTB+0, 1
;MyProject.c,12 :: 		Delay_ms(500) ;         // wait 500 ms
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;MyProject.c,13 :: 		}
	GOTO       L_main0
;MyProject.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
