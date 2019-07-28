
_main:

;void_main__MyProject.c,1 :: 		void main()
;void_main__MyProject.c,3 :: 		TRISB = 0 ;     // set PORTB as OUTPUT
	CLRF       TRISB+0
;void_main__MyProject.c,5 :: 		for(;;)         // forever
L_main0:
;void_main__MyProject.c,7 :: 		PORTB.B0 =1<<5 ;          // turn LEDs ON
	BCF        PORTB+0, 0
;void_main__MyProject.c,8 :: 		Delay_ms(500) ;         // wait 500 ms
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
;void_main__MyProject.c,9 :: 		PORTB.B0 = 1<<5 ;          // turn LEDs OFF
	BCF        PORTB+0, 0
;void_main__MyProject.c,10 :: 		Delay_ms(500) ;         // wait 500 ms
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
;void_main__MyProject.c,11 :: 		}
	GOTO       L_main0
;void_main__MyProject.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
