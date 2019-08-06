#line 1 "Z:/home/angicia/Desktop/MikroC/05.HexBits/Base.c"
void main()
{
 TRISB = 0x00;

 while(1)
 {
 PORTB = 0x01;
 Delay_ms(1000);
 PORTB = 0x00;
 Delay_ms(1000);
 }
}
