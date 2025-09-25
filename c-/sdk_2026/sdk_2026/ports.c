/*
 * ports.c
 *
 * Created: 9/22/2025 4:32:22 PM
 *  Author: josel
 */
#include <avr/io.h>
void init_ports(void)
{
	//configura PB5 como salida
	DDRB |= 1 << PB5;
	//configura PD2 como entrada
	DDRD &= ~(1 << PD2);
	PORTD |= (1 << PD2);
}