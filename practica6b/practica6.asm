
_interrupt:

;practica6.c,3 :: 		void interrupt() // rutina de servicio de la interrupción (MikroC)
;practica6.c,5 :: 		if(INTCON3.INT1IF)   {
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt0
;practica6.c,6 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;practica6.c,7 :: 		TMR0H = (3036 >>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;practica6.c,8 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;practica6.c,9 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;practica6.c,10 :: 		INTCON3.INT1IE = 0;
	BCF         INTCON3+0, 3 
;practica6.c,11 :: 		}
L_interrupt0:
;practica6.c,12 :: 		if(INTCON.TMR0IF)   {
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;practica6.c,13 :: 		TMR0H = (3036 >>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;practica6.c,14 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;practica6.c,15 :: 		aux++;
	INFSNZ      _aux+0, 1 
	INCF        _aux+1, 1 
;practica6.c,16 :: 		if(aux==5)
	MOVLW       0
	XORWF       _aux+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt7
	MOVLW       5
	XORWF       _aux+0, 0 
L__interrupt7:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
;practica6.c,18 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;practica6.c,19 :: 		T0CON.TMR0ON=0;
	BCF         T0CON+0, 7 
;practica6.c,20 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;practica6.c,21 :: 		}
L_interrupt2:
;practica6.c,22 :: 		}
L_interrupt1:
;practica6.c,23 :: 		INTCON3.INT1IF = 0; // se borra el flag de la interrupción INT1
	BCF         INTCON3+0, 0 
;practica6.c,24 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;practica6.c,25 :: 		PORTC.B7 = !PORTC.B7;
	BTG         PORTC+0, 7 
;practica6.c,27 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;practica6.c,29 :: 		void main()
;practica6.c,31 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;practica6.c,32 :: 		PORTC = 0;
	CLRF        PORTC+0 
;practica6.c,34 :: 		TRISB = 0x02; // se configura RB1 como entrada
	MOVLW       2
	MOVWF       TRISB+0 
;practica6.c,35 :: 		PORTB=0;
	CLRF        PORTB+0 
;practica6.c,37 :: 		INTCON.PEIE = 0; // es una interrupción de tipo core
	BCF         INTCON+0, 6 
;practica6.c,38 :: 		RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
	BCF         RCON+0, 7 
;practica6.c,39 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;practica6.c,40 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;practica6.c,45 :: 		RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad (MikroC)
	BCF         RCON+0, 7 
;practica6.c,46 :: 		INTCON2.INTEDG1 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BSF         INTCON2+0, 5 
;practica6.c,47 :: 		INTCON3.INT1IF = 0; // se pone el flag de la interrupción INT1 a 0
	BCF         INTCON3+0, 0 
;practica6.c,48 :: 		INTCON3.INT1IE = 1; // se habilita la interrupción INT1
	BSF         INTCON3+0, 3 
;practica6.c,49 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;practica6.c,52 :: 		while(1);
L_main3:
	GOTO        L_main3
;practica6.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
