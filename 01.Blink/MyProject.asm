
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,3 :: 		TRISB = 0;
	CLRF       TRISB+0
;MyProject.c,4 :: 		while(1)
L_main0:
;MyProject.c,6 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,7 :: 		Delay_ms(1000);
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
;MyProject.c,8 :: 		PORTB = 0;
	CLRF       PORTB+0
;MyProject.c,9 :: 		Delay_ms(1000);
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
;MyProject.c,10 :: 		}
	GOTO       L_main0
;MyProject.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
