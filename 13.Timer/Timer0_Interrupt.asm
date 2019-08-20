
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Timer0_Interrupt.c,4 :: 		void interrupt() {
;Timer0_Interrupt.c,5 :: 		if (TMR0IF_bit) {
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
;Timer0_Interrupt.c,6 :: 		cnt++;                 // increment counter
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Timer0_Interrupt.c,7 :: 		TMR0IF_bit = 0;        // clear TMR0IF
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Timer0_Interrupt.c,8 :: 		TMR0   = 96;
	MOVLW      96
	MOVWF      TMR0+0
;Timer0_Interrupt.c,9 :: 		}
L_interrupt0:
;Timer0_Interrupt.c,10 :: 		}
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

;Timer0_Interrupt.c,12 :: 		void main() {
;Timer0_Interrupt.c,13 :: 		OPTION_REG = 0x84;       // Assign prescaler to TMR0
	MOVLW      132
	MOVWF      OPTION_REG+0
;Timer0_Interrupt.c,14 :: 		ANSEL  = 0;              // Configure AN pins as digital
	CLRF       ANSEL+0
;Timer0_Interrupt.c,15 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Timer0_Interrupt.c,16 :: 		C1ON_bit = 0;            // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Timer0_Interrupt.c,17 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Timer0_Interrupt.c,18 :: 		TRISB = 0;               // PORTB is output
	CLRF       TRISB+0
;Timer0_Interrupt.c,19 :: 		PORTB = 0xFF;            // Initialize PORTB
	MOVLW      255
	MOVWF      PORTB+0
;Timer0_Interrupt.c,20 :: 		TMR0  = 96;              // Timer0 initial value
	MOVLW      96
	MOVWF      TMR0+0
;Timer0_Interrupt.c,21 :: 		INTCON = 0xA0;           // Enable TMRO interrupt
	MOVLW      160
	MOVWF      INTCON+0
;Timer0_Interrupt.c,22 :: 		cnt = 0;                 // Initialize cnt
	CLRF       _cnt+0
	CLRF       _cnt+1
;Timer0_Interrupt.c,24 :: 		do {
L_main1:
;Timer0_Interrupt.c,25 :: 		if (cnt >= 400) {
	MOVLW      1
	SUBWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      144
	SUBWF      _cnt+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Timer0_Interrupt.c,26 :: 		PORTB = ~PORTB;      // Toggle PORTB LEDs
	COMF       PORTB+0, 1
;Timer0_Interrupt.c,27 :: 		cnt = 0;             // Reset cnt
	CLRF       _cnt+0
	CLRF       _cnt+1
;Timer0_Interrupt.c,28 :: 		}
L_main4:
;Timer0_Interrupt.c,29 :: 		} while(1);
	GOTO       L_main1
;Timer0_Interrupt.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
