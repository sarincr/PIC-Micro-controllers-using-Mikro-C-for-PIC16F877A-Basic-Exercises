
unsigned short cnt;

void interrupt() {
  if (TMR1IF_bit) {
    cnt++;                    // increment counter
    TMR1IF_bit = 0;           // clear TMR0IF
    TMR1H = 0x80;
    TMR1L = 0x00;
  }
}

void main() {
  ANSEL  = 0;                 // Configure AN pins as digital
  ANSELH = 0;
  C1ON_bit = 0;               // Disable comparators
  C2ON_bit = 0;
  PORTB = 0xFF;               // Initialize PORTB
  TRISB = 0;                  // PORTB is output
  T1CON = 1;                  // Timer1 settings
  TMR1IF_bit = 0;             // clear TMR1IF
  TMR1H = 0x80;               // Initialize Timer1 register
  TMR1L = 0x00;
  TMR1IE_bit = 1;             // enable Timer1 interrupt

  cnt =   0;                  // initialize cnt
  INTCON = 0xC0;              // Set GIE, PEIE

  do {
    if (cnt >= 72) {
      PORTB  = ~PORTB;        // Toggle PORTB LEDs
      cnt = 0;                // Reset cnt
    }
  } while (1);
}