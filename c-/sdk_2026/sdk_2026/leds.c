/*
 * leds.c
 *
 * Created: 9/22/2025 4:34:29 PM
 *  Author: josel
 */ 
#include <avr/io.h>
#include <avr/delay.h>

void led_on_off()
{
	PORTB ^= 1 << PB5;
	_delay_ms(200);
}