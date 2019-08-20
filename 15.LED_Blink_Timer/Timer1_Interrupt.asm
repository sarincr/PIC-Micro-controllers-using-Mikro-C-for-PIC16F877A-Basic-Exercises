
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Timer1_Interrupt.c,2 :: 		void Interrupt(){
;Timer1_Interrupt.c,3 :: 		if (TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;Timer1_Interrupt.c,4 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Timer1_Interrupt.c,5 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;Timer1_Interrupt.c,6 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;Timer1_Interrupt.c,7 :: 		PORTB  = ~PORTB;
	COMF       PORTB+0, 1
;Timer1_Interrupt.c,8 :: 		}
L_Interrupt0:
;Timer1_Interrupt.c,9 :: 		}
L_end_Interrupt:
L__Interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;Timer1_Interrupt.c,11 :: 		void main()
;Timer1_Interrupt.c,13 :: 		ANSEL  = 0;                 // Configure AN pins as digital
	CLRF       ANSEL+0
;Timer1_Interrupt.c,14 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Timer1_Interrupt.c,15 :: 		C1ON_bit = 0;               // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Timer1_Interrupt.c,16 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Timer1_Interrupt.c,17 :: 		PORTB = 0xFF;               // Initialize PORTB
	MOVLW      255
	MOVWF      PORTB+0
;Timer1_Interrupt.c,18 :: 		TRISB = 0;                  // PORTB is output
	CLRF       TRISB+0
;Timer1_Interrupt.c,19 :: 		T1CON	 = 0x21;
	MOVLW      33
	MOVWF      T1CON+0
;Timer1_Interrupt.c,20 :: 		TMR1IF_bit	 = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Timer1_Interrupt.c,21 :: 		TMR1H	 = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;Timer1_Interrupt.c,22 :: 		TMR1L	 = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;Timer1_Interrupt.c,23 :: 		TMR1IE_bit	 = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;Timer1_Interrupt.c,24 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;Timer1_Interrupt.c,26 :: 		do {
L_main1:
;Timer1_Interrupt.c,27 :: 		} while (1);
	GOTO       L_main1
;Timer1_Interrupt.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
