/*
 * sdk_2026.c
 *
 * Created: 9/22/2025 4:29:40 PM
 * Author : josel
 */ 

#include <avr/io.h>
#include "ports.h"
#include "leds.h"

int main(void)
{
    /* Replace with your application code */
    init_ports();
	while (1) 
    {
		led_on_off();
    }
}

