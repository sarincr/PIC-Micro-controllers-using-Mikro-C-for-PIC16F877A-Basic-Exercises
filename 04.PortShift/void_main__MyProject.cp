#line 1 "C:/users/angicia/Desktop/MikroC/04.PortShift/void_main__MyProject.c"
void main()
 {
 TRISB = 0 ;

 for(;;)
 {
 PORTB.B0 =1<<5 ;
 Delay_ms(500) ;
 PORTB.B0 = 1<<5 ;
 Delay_ms(500) ;
 }
 }
