#line 1 "Z:/home/angicia/Desktop/MikroC/08.Button/MyProject.c"
void main()
{
 TRISA.F1 = 1;
 TRISB.F0 = 0;
 PORTB.F1 = 0;
 do
 {
 if(PORTA.F1 == 0)
 {
 PORTB.F0 = 1;
 }
 if(PORTA.F1 == 1)
 {
 PORTB.F0 = 0;
 }
 }while(1);
}
