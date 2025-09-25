/*
 * ext_int.c
 *
 * Created: 9/24/2025 4:47:19 PM
 *  Author: josel
 */ 
#include <avr/interrupt.h>
#include "leds.h"

ISR(INT0_vect)
{
		led_on_off_fast();
}

void init_int0(void)
{
	EICRA |= (1 << ISC00); //Define pulso de subida
	EIMSK |= (1 << INT0);
	sei();
}