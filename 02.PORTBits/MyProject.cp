#line 1 "C:/users/angicia/Desktop/MikroC/MyProject.c"
void main()
{
 TRISB.F0 = 0;

 while(1)
 {
 PORTB.F0 = 1;
 Delay_ms(1000);
 PORTB.F0 = 0;
 Delay_ms(1000);
 }
}
