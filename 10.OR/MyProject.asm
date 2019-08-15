
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,5 :: 		TRISA.F1 = 1; //Configure 1st bit of PORTD as input
	BSF        TRISA+0, 1
;MyProject.c,6 :: 		TRISA.F2 = 1; //Configure 1st bit of PORTD as input
	BSF        TRISA+0, 2
;MyProject.c,8 :: 		TRISB.F0 = 0; //Configure 1st bit of PORTB as output
	BCF        TRISB+0, 0
;MyProject.c,10 :: 		PORTB.F1 = 0; //LED OFF
	BCF        PORTB+0, 1
;MyProject.c,12 :: 		do
L_main0:
;MyProject.c,16 :: 		if((PORTA.F1 == 0)&& (PORTA.F2 == 0))   //If the switch is pressed
	BTFSC      PORTA+0, 1
	GOTO       L_main5
	BTFSC      PORTA+0, 2
	GOTO       L_main5
L__main10:
;MyProject.c,20 :: 		PORTB.F0 = 1; //LED ON
	BSF        PORTB+0, 0
;MyProject.c,22 :: 		}
L_main5:
;MyProject.c,24 :: 		if((PORTA.F1 == 1)&& (PORTA.F2 == 1))   //If the switch is not pressed
	BTFSS      PORTA+0, 1
	GOTO       L_main8
	BTFSS      PORTA+0, 2
	GOTO       L_main8
L__main9:
;MyProject.c,28 :: 		PORTB.F0 = 0; //LED ON
	BCF        PORTB+0, 0
;MyProject.c,30 :: 		}
L_main8:
;MyProject.c,32 :: 		}while(1);
	GOTO       L_main0
;MyProject.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
