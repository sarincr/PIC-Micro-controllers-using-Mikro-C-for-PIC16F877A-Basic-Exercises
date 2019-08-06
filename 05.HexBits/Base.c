void main()
{
  TRISB = 0x00; //Makes PORTB0 or RB0 Output Pin

  while(1) //Infinite Loop
  {
    PORTB = 0x01; //LED ON
    Delay_ms(1000); //1 Second Delay
    PORTB = 0x00; //LED OFF
    Delay_ms(1000); //1 Second Delay
  }
}