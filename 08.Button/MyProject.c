void main()
{
  TRISA.F1 = 1; //Configure 1st bit of PORTD as input
  TRISB.F0 = 0; //Configure 1st bit of PORTB as output
  PORTB.F1 = 0; //LED OFF
  do
  {
    if(PORTA.F1 == 0)   //If the switch is pressed
    {
       PORTB.F0 = 1; //LED ON
    }
    if(PORTA.F1 == 1)   //If the switch is not pressed
    {
       PORTB.F0 = 0; //LED ON
    }
 }while(1);
}