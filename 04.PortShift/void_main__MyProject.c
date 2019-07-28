void main()
        {
        TRISB = 0 ;     // set PORTB as OUTPUT

        for(;;)         // forever
                {
                PORTB.B0 =1<<5 ;          // turn LEDs ON
                Delay_ms(500) ;         // wait 500 ms
                PORTB.B0 = 1<<5 ;          // turn LEDs OFF
                Delay_ms(500) ;         // wait 500 ms
                }
        }