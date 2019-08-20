
void Interrupt(){
  if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H	 = 0x3C;
    TMR1L	 = 0xB0;
    PORTB  = ~PORTB;
  }
}

void main() 
{
  ANSEL  = 0;                 // Configure AN pins as digital
  ANSELH = 0;
  C1ON_bit = 0;               // Disable comparators
  C2ON_bit = 0;
  PORTB = 0xFF;               // Initialize PORTB
  TRISB = 0;                  // PORTB is output
  T1CON	 = 0x21;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x3C;
  TMR1L	 = 0xB0;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;

  do {
  } while (1);
}