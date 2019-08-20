
unsigned cnt;

void interrupt() {
  if (TMR0IF_bit) {
    cnt++;                 // increment counter
    TMR0IF_bit = 0;        // clear TMR0IF
    TMR0   = 96;
  }
}

void main() {
  OPTION_REG = 0x84;       // Assign prescaler to TMR0
  ANSEL  = 0;              // Configure AN pins as digital
  ANSELH = 0;
  C1ON_bit = 0;            // Disable comparators
  C2ON_bit = 0;
  TRISB = 0;               // PORTB is output
  PORTB = 0xFF;            // Initialize PORTB
  TMR0  = 96;              // Timer0 initial value
  INTCON = 0xA0;           // Enable TMRO interrupt
  cnt = 0;                 // Initialize cnt

  do {
    if (cnt >= 400) {
      PORTB = ~PORTB;      // Toggle PORTB LEDs
      cnt = 0;             // Reset cnt
    }
  } while(1);
}