
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,3 :: 		TRISA.F1 = 1; //Configure 1st bit of PORTD as input
	BSF        TRISA+0, 1
;MyProject.c,4 :: 		TRISB.F0 = 0; //Configure 1st bit of PORTB as output
	BCF        TRISB+0, 0
;MyProject.c,5 :: 		PORTB.F1 = 0; //LED OFF
	BCF        PORTB+0, 1
;MyProject.c,6 :: 		do
L_main0:
;MyProject.c,8 :: 		if(PORTA.F1 == 0)   //If the switch is pressed
	BTFSC      PORTA+0, 1
	GOTO       L_main3
;MyProject.c,10 :: 		PORTB.F0 = 1; //LED ON
	BSF        PORTB+0, 0
;MyProject.c,11 :: 		}
L_main3:
;MyProject.c,12 :: 		if(PORTA.F1 == 1)   //If the switch is not pressed
	BTFSS      PORTA+0, 1
	GOTO       L_main4
;MyProject.c,14 :: 		PORTB.F0 = 0; //LED ON
	BCF        PORTB+0, 0
;MyProject.c,15 :: 		}
L_main4:
;MyProject.c,16 :: 		}while(1);
	GOTO       L_main0
;MyProject.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
