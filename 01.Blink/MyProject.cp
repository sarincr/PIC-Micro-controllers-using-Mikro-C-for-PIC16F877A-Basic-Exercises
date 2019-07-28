#line 1 "C:/users/angicia/Desktop/MikroC/01.Blink/MyProject.c"
void main()
{
 TRISB = 0;
 while(1)
 {
 PORTB = 1;
 Delay_ms(1000);
 PORTB = 0;
 Delay_ms(1000);
 }
}
