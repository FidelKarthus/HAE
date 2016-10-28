
_interrupt:

;practica7b.c,21 :: 		void interrupt() //se ha pulsado una tecla
;practica7b.c,24 :: 		if(INTCON.TMR0IF)   {
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;practica7b.c,25 :: 		TMR0H = (3336 >>8);
	MOVLW       13
	MOVWF       TMR0H+0 
;practica7b.c,26 :: 		TMR0L = 3336;
	MOVLW       8
	MOVWF       TMR0L+0 
;practica7b.c,27 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;practica7b.c,28 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;practica7b.c,29 :: 		}
L_interrupt0:
;practica7b.c,30 :: 		if(PIR1.ADIF)   {
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt1
;practica7b.c,31 :: 		aux = (ADRESL >> 6);
	MOVLW       6
	MOVWF       R0 
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
	MOVF        R0, 0 
L__interrupt6:
	BZ          L__interrupt7
	RRCF        _aux+0, 1 
	BCF         _aux+0, 7 
	ADDLW       255
	GOTO        L__interrupt6
L__interrupt7:
	MOVLW       0
	MOVWF       _aux+1 
;practica7b.c,32 :: 		aux = aux + (ADRESH << 2);
	MOVF        ADRESH+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        _aux+0, 0 
	ADDWF       R0, 1 
	MOVF        _aux+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
;practica7b.c,33 :: 		num = aux*4.8875e-1;
	CALL        _word2double+0, 0
	MOVLW       113
	MOVWF       R4 
	MOVLW       61
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;practica7b.c,34 :: 		FloatToStr (num, txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;practica7b.c,35 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica7b.c,36 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;practica7b.c,37 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;practica7b.c,39 :: 		}
L_interrupt1:
;practica7b.c,40 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;practica7b.c,42 :: 		void main() {
;practica7b.c,43 :: 		TRISE = 0x01;
	MOVLW       1
	MOVWF       TRISE+0 
;practica7b.c,44 :: 		PORTE = 0x00;
	CLRF        PORTE+0 
;practica7b.c,45 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;practica7b.c,46 :: 		ADRESL = 0x00;
	CLRF        ADRESL+0 
;practica7b.c,47 :: 		ADRESH = 0x00;
	CLRF        ADRESH+0 
;practica7b.c,50 :: 		INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
	BCF         INTCON2+0, 7 
;practica7b.c,51 :: 		ADCON1 = 0x00;
	CLRF        ADCON1+0 
;practica7b.c,52 :: 		ADCON0 = 0x75;
	MOVLW       117
	MOVWF       ADCON0+0 
;practica7b.c,53 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;practica7b.c,54 :: 		PIE1.ADIE=1;
	BSF         PIE1+0, 6 
;practica7b.c,55 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;practica7b.c,56 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;practica7b.c,58 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;practica7b.c,59 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;practica7b.c,60 :: 		T0CON = 0x85;
	MOVLW       133
	MOVWF       T0CON+0 
;practica7b.c,61 :: 		TMR0H = (3336 >>8);
	MOVLW       13
	MOVWF       TMR0H+0 
;practica7b.c,62 :: 		TMR0L = 3336;
	MOVLW       8
	MOVWF       TMR0L+0 
;practica7b.c,64 :: 		while(1);
L_main2:
	GOTO        L_main2
;practica7b.c,65 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
