/*
 * sdk_2026.c
 *
 * Created: 9/22/2025 4:29:40 PM
 * Author : josel
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include "ports.h"
#include "leds.h"
#include "ext_int.h"
#include "timers.h"

int main(void)
{
    /* Replace with your application code */
    init_ports();
	init_int0();
	//timer0_normalmode_noprescaler();
	//timer0_overflow_interrupt();
	timer1_CTCmode_interrupt();
	sei();
	while (1) 
    {
	 //led_on_off();
    }
}

