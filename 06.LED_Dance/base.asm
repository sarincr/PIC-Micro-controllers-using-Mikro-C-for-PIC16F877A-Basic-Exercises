
_main:

;base.c,1 :: 		void main()
;base.c,3 :: 		CMCON = 0x07; // To turn off comparators
	MOVLW      7
	MOVWF      CMCON+0
;base.c,4 :: 		ADCON1 = 0x06; // To turn off adc
	MOVLW      6
	MOVWF      ADCON1+0
;base.c,5 :: 		TRISB = 0x00; // Sets all pins in PORTB as output
	CLRF       TRISB+0
;base.c,6 :: 		PORTB = 1; // Set RB0 to high 00000001
	MOVLW      1
	MOVWF      PORTB+0
;base.c,7 :: 		do // To set infinite loop
L_main0:
;base.c,9 :: 		Delay_ms(300); // 300 mili seconds delay
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;base.c,10 :: 		PORTB = PORTB<<1; //Shifting right by one bit
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;base.c,11 :: 		if(PORTB >= 0b10000000) //To reset to 00000001
	MOVLW      128
	SUBWF      PORTB+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;base.c,13 :: 		Delay_ms(350); // 350 mili seconds delay
	MOVLW      4
	MOVWF      R11+0
	MOVLW      142
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;base.c,14 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;base.c,15 :: 		}
L_main4:
;base.c,16 :: 		}while(1); // To set infinite loop
	GOTO       L_main0
;base.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
