
_interrupt:

;practica10a.c,6 :: 		void interrupt()
;practica10a.c,8 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;practica10a.c,12 :: 		freq++;
	INCF        _freq+0, 1 
;practica10a.c,14 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica10a.c,15 :: 		}
L_interrupt0:
;practica10a.c,16 :: 		if(INTCON3.INT1IF)
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt1
;practica10a.c,18 :: 		if(freq > 1)
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _freq+0, 0 
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
;practica10a.c,20 :: 		freq--;
	DECF        _freq+0, 1 
;practica10a.c,21 :: 		}
L_interrupt2:
;practica10a.c,22 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;practica10a.c,23 :: 		}
L_interrupt1:
;practica10a.c,25 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_main:

;practica10a.c,27 :: 		void main() {
;practica10a.c,28 :: 		TRISB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;practica10a.c,29 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;practica10a.c,30 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;practica10a.c,31 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;practica10a.c,32 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;practica10a.c,34 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;practica10a.c,35 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;practica10a.c,36 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;practica10a.c,37 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;practica10a.c,38 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;practica10a.c,40 :: 		TRISB.B1 = 1; // se configura RB1 como entrada
	BSF         TRISB+0, 1 
;practica10a.c,41 :: 		INTCON.PEIE = 0; // es de tipo core
	BCF         INTCON+0, 6 
;practica10a.c,42 :: 		RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad (MikroC)
	BCF         RCON+0, 7 
;practica10a.c,43 :: 		INTCON2.INTEDG1 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BSF         INTCON2+0, 5 
;practica10a.c,44 :: 		INTCON3.INT1IF = 0; // se pone el flag de la interrupción INT1 a 0
	BCF         INTCON3+0, 0 
;practica10a.c,45 :: 		INTCON3.INT1IE = 1; // se habilita la interrupción INT1
	BSF         INTCON3+0, 3 
;practica10a.c,46 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;practica10a.c,49 :: 		while(1){
L_main4:
;practica10a.c,51 :: 		for (paquete=0;paquete<=4095;paquete+=freq){
	CLRF        _paquete+0 
	CLRF        _paquete+1 
L_main6:
	MOVLW       128
	XORLW       15
	MOVWF       R0 
	MOVLW       128
	XORWF       _paquete+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVF        _paquete+0, 0 
	SUBLW       255
L__main17:
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
;practica10a.c,53 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;practica10a.c,54 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        _paquete+1, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       _paquete+1, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       15
	ANDWF       R0, 1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       48
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
;practica10a.c,55 :: 		SPI1_Write(aux);
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;practica10a.c,56 :: 		SPI1_Write(paquete);
	MOVF        _paquete+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;practica10a.c,57 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;practica10a.c,58 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	NOP
;practica10a.c,51 :: 		for (paquete=0;paquete<=4095;paquete+=freq){
	MOVF        _freq+0, 0 
	ADDWF       _paquete+0, 1 
	MOVLW       0
	BTFSC       _freq+0, 7 
	MOVLW       255
	ADDWFC      _paquete+1, 1 
;practica10a.c,60 :: 		}
	GOTO        L_main6
L_main7:
;practica10a.c,61 :: 		for (paquete=4095;paquete>=0;paquete-=freq){
	MOVLW       255
	MOVWF       _paquete+0 
	MOVLW       15
	MOVWF       _paquete+1 
L_main10:
	MOVLW       128
	XORWF       _paquete+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       0
	SUBWF       _paquete+0, 0 
L__main18:
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
;practica10a.c,63 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;practica10a.c,64 :: 		aux = 0x30 | ((paquete >> 8) & 0x0F);
	MOVF        _paquete+1, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       _paquete+1, 7 
	MOVLW       255
	MOVWF       R1 
	MOVLW       15
	ANDWF       R0, 1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       48
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
;practica10a.c,65 :: 		SPI1_Write(aux);
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;practica10a.c,66 :: 		SPI1_Write(paquete);
	MOVF        _paquete+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;practica10a.c,67 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;practica10a.c,68 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	NOP
;practica10a.c,61 :: 		for (paquete=4095;paquete>=0;paquete-=freq){
	MOVF        _freq+0, 0 
	SUBWF       _paquete+0, 1 
	MOVLW       0
	BTFSC       _freq+0, 7 
	MOVLW       255
	SUBWFB      _paquete+1, 1 
;practica10a.c,70 :: 		}
	GOTO        L_main10
L_main11:
;practica10a.c,71 :: 		}
	GOTO        L_main4
;practica10a.c,73 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
