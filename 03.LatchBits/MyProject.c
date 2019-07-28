void main()
        {
        TRISB = 0 ;     // set PORTB as OUTPUT

        for(;;)         // forever
                {
                PORTB.B0 = 1 ;          // turn LEDs ON
                PORTB.B1 = 0 ;          // turn LEDs OFF
                Delay_ms(500) ;         // wait 500 ms
                PORTB.B0 = 0 ;          // turn LEDs ON
                PORTB.B1 =1 ;          // turn LEDs OFF
                Delay_ms(500) ;         // wait 500 ms
                }
        }