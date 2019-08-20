
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Timer1_Interrupt.c,4 :: 		void interrupt() {
;Timer1_Interrupt.c,5 :: 		if (TMR1IF_bit) {
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt0
;Timer1_Interrupt.c,6 :: 		cnt++;                    // increment counter
	INCF       _cnt+0, 1
;Timer1_Interrupt.c,7 :: 		TMR1IF_bit = 0;           // clear TMR0IF
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Timer1_Interrupt.c,8 :: 		TMR1H = 0x80;
	MOVLW      128
	MOVWF      TMR1H+0
;Timer1_Interrupt.c,9 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;Timer1_Interrupt.c,10 :: 		}
L_interrupt0:
;Timer1_Interrupt.c,11 :: 		}
L_end_interrupt:
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Timer1_Interrupt.c,13 :: 		void main() {
;Timer1_Interrupt.c,14 :: 		ANSEL  = 0;                 // Configure AN pins as digital
	CLRF       ANSEL+0
;Timer1_Interrupt.c,15 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Timer1_Interrupt.c,16 :: 		C1ON_bit = 0;               // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Timer1_Interrupt.c,17 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Timer1_Interrupt.c,18 :: 		PORTB = 0xFF;               // Initialize PORTB
	MOVLW      255
	MOVWF      PORTB+0
;Timer1_Interrupt.c,19 :: 		TRISB = 0;                  // PORTB is output
	CLRF       TRISB+0
;Timer1_Interrupt.c,20 :: 		T1CON = 1;                  // Timer1 settings
	MOVLW      1
	MOVWF      T1CON+0
;Timer1_Interrupt.c,21 :: 		TMR1IF_bit = 0;             // clear TMR1IF
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Timer1_Interrupt.c,22 :: 		TMR1H = 0x80;               // Initialize Timer1 register
	MOVLW      128
	MOVWF      TMR1H+0
;Timer1_Interrupt.c,23 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;Timer1_Interrupt.c,24 :: 		TMR1IE_bit = 1;             // enable Timer1 interrupt
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;Timer1_Interrupt.c,26 :: 		cnt =   0;                  // initialize cnt
	CLRF       _cnt+0
;Timer1_Interrupt.c,27 :: 		INTCON = 0xC0;              // Set GIE, PEIE
	MOVLW      192
	MOVWF      INTCON+0
;Timer1_Interrupt.c,29 :: 		do {
L_main1:
;Timer1_Interrupt.c,30 :: 		if (cnt >= 72) {
	MOVLW      72
	SUBWF      _cnt+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Timer1_Interrupt.c,31 :: 		PORTB  = ~PORTB;        // Toggle PORTB LEDs
	COMF       PORTB+0, 1
;Timer1_Interrupt.c,32 :: 		cnt = 0;                // Reset cnt
	CLRF       _cnt+0
;Timer1_Interrupt.c,33 :: 		}
L_main4:
;Timer1_Interrupt.c,34 :: 		} while (1);
	GOTO       L_main1
;Timer1_Interrupt.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
