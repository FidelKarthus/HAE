
_interrupt:

;practica6a.c,1 :: 		void interrupt() // rutina de servicio de la interrupción (MikroC)
;practica6a.c,3 :: 		if(PORTC.B0 == 1)   {
	BTFSS       PORTC+0, 0 
	GOTO        L_interrupt0
;practica6a.c,4 :: 		T0CON = 0xc1;
	MOVLW       193
	MOVWF       T0CON+0 
;practica6a.c,5 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;practica6a.c,6 :: 		}
	GOTO        L_interrupt1
L_interrupt0:
;practica6a.c,8 :: 		T0CON = 0xc2;
	MOVLW       194
	MOVWF       T0CON+0 
;practica6a.c,9 :: 		TMR0L = 81;
	MOVLW       81
	MOVWF       TMR0L+0 
;practica6a.c,10 :: 		}
L_interrupt1:
;practica6a.c,11 :: 		PORTC.B0 = !PORTC.B0;
	BTG         PORTC+0, 0 
;practica6a.c,12 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;practica6a.c,13 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;practica6a.c,14 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;practica6a.c,15 :: 		void main()
;practica6a.c,17 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;practica6a.c,18 :: 		PORTC=0;
	CLRF        PORTC+0 
;practica6a.c,20 :: 		T0CON = 0xc1;
	MOVLW       193
	MOVWF       T0CON+0 
;practica6a.c,21 :: 		INTCON.PEIE = 0; // es una interrupción de tipo core
	BCF         INTCON+0, 6 
;practica6a.c,22 :: 		RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;practica6a.c,23 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;practica6a.c,24 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;practica6a.c,25 :: 		TMR0L = 106; //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       106
	MOVWF       TMR0L+0 
;practica6a.c,26 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;practica6a.c,28 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;practica6a.c,29 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;practica6a.c,30 :: 		while(1);
L_main2:
	GOTO        L_main2
;practica6a.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
