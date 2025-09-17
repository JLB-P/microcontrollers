;
; L_01.asm
/*
	1.I/O registers (Datasheet pag.624)
	2.Stack Pointer (indespensable para uso de subrutinas)
		-Init Stack (stack allways decrements)
		-SRAM memory (pag.22)
	3.Depurar subrutinas
		-Break points (more than one)
		-Subruotine Time measurement
		-Stack
	4.SimulIDE
		-Output Current calculation..
*/
.cseg
.org 0x00	;Origen del código
.def temp = r16
.def counter = r17
.def multiplier = r18

;Programa principal
	;Inicia Stack
	ldi temp,high(RAMEND) ;Obtiene byte alto
	out SPH,Temp
	ldi temp,low(RAMEND) ;Obtiene byte bajo
	out SPL,Temp
	;set PB5 -> out
	sbi DDRB,PB5
	
start:
	ldi counter,20  ;Frecuencia 1
	rcall on_off	;Salta a la rutina on/off con valor para frecuencia 1

;ciclo que verifica si un botón conectado en el pin de está cerrado o abierto.
verify_push:
	in temp,PINB
	andi temp,0b00001000
	cpi temp,0x08
	breq start		;Si botón abierto, repite

	;Si botón oprimido, salta a rutina on/off a frecuencia 2
	ldi counter,255 ;Frecuencia 2
	rcall on_off	;salta a rutina on/off con valor para frecuencia 2
    rjmp verify_push
	;4. usando el debug, explique el uso del stack para el salto a subrutinas y regreso de una subrutina,
	;	mostrando las direcciones del PC, SP y las alamcenadas en la pila (en RAM), antes y después de
	;	ejecutar las subrutinas.
	;5. con ayuda del debug, determine el valor de la frecuencia 1
	;6. mediante el debug, determine el valor de la frecuencia 2

;Subrutinas
/****************************************
* Rutina para encender y apagar el bit0.
* Entrada: ninguna
* Salida: ninguna
*****************************************/
on_off:
	sbi PORTB,PB5 ;Enciende bit
	rcall delay ;Espera
	cbi PORTB,PB5 ;Apaga bit
	rcall delay ;Espera
	ret

/****************************************
* Rutina de retardo, dado por counter y
* el valor definido en temp.
* Entrada: counter, temp
* Salida: retardo= counter x temp
*****************************************/
delay:
c2:		ldi temp,167
c1:		dec temp
		brne c1
		dec counter 
		brne c2
		ret