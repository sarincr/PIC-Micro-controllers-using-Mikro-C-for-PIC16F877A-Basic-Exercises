void main()
{
  int i=0;
  TRISB = 0x00; // Sets all pins in PORTB as output

  do // To set infinite loop
  {
    for(i=0;i<8;i++)
    {
    PORTB = 1<<i; //Shifting right by one bit
    Delay_ms(100);
    }
  }while(1); // To set infinite loop
}