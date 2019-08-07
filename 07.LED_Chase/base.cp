#line 1 "Z:/home/angicia/Desktop/MikroC/07.LED_Chase/base.c"
void main()
{
 int i=0;
 TRISB = 0x00;

 do
 {
 for(i=0;i<8;i++)
 {
 PORTB = 1<<i;
 Delay_ms(100);
 }
 }while(1);
}
