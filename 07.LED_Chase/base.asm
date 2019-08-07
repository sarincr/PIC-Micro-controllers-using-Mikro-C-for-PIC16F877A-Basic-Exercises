
_main:

;base.c,1 :: 		void main()
;base.c,3 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;base.c,4 :: 		TRISB = 0x00; // Sets all pins in PORTB as output
	CLRF       TRISB+0
;base.c,6 :: 		do // To set infinite loop
L_main0:
;base.c,8 :: 		for(i=0;i<8;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main3:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      8
	SUBWF      main_i_L0+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;base.c,10 :: 		PORTB = 1<<i; //Shifting right by one bit
	MOVF       main_i_L0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main9:
	BTFSC      STATUS+0, 2
	GOTO       L__main10
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main9
L__main10:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;base.c,11 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;base.c,8 :: 		for(i=0;i<8;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;base.c,12 :: 		}
	GOTO       L_main3
L_main4:
;base.c,13 :: 		}while(1); // To set infinite loop
	GOTO       L_main0
;base.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
