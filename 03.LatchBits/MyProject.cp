#line 1 "C:/users/angicia/Desktop/MikroC/03.LatchBits/MyProject.c"
void main()
 {
 TRISB = 0 ;

 for(;;)
 {
 PORTB.B0 = 1 ;
 PORTB.B1 = 0 ;
 Delay_ms(500) ;
 PORTB.B0 = 0 ;
 PORTB.B1 =1 ;
 Delay_ms(500) ;
 }
 }
