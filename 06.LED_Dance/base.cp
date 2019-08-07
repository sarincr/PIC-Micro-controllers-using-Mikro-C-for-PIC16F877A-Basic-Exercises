#line 1 "Z:/home/angicia/Desktop/MikroC/06.LED_Dance/base.c"
void main()
{
 CMCON = 0x07;
 ADCON1 = 0x06;
 TRISB = 0x00;
 PORTB = 1;
 do
 {
 Delay_ms(300);
 PORTB = PORTB<<1;
 if(PORTB >= 0b10000000)
 {
 Delay_ms(350);
 PORTB = 1;
 }
 }while(1);
}
