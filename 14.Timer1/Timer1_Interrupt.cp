#line 1 "C:/Users/ANGICIA/Desktop/Mikroc/14.Timer1/Timer1_Interrupt.c"

unsigned short cnt;

void interrupt() {
 if (TMR1IF_bit) {
 cnt++;
 TMR1IF_bit = 0;
 TMR1H = 0x80;
 TMR1L = 0x00;
 }
}

void main() {
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 PORTB = 0xFF;
 TRISB = 0;
 T1CON = 1;
 TMR1IF_bit = 0;
 TMR1H = 0x80;
 TMR1L = 0x00;
 TMR1IE_bit = 1;

 cnt = 0;
 INTCON = 0xC0;

 do {
 if (cnt >= 72) {
 PORTB = ~PORTB;
 cnt = 0;
 }
 } while (1);
}
