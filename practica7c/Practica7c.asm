
_interrupt:

;Practica7c.c,23 :: 		void interrupt() //se ha pulsado una tecla
;Practica7c.c,25 :: 		if(INTCON.INT0IF)   {
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;Practica7c.c,26 :: 		if (count == 3){
	MOVF        _count+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;Practica7c.c,27 :: 		count = 1;
	MOVLW       1
	MOVWF       _count+0 
;Practica7c.c,28 :: 		} else {
	GOTO        L_interrupt2
L_interrupt1:
;Practica7c.c,29 :: 		count++;
	INCF        _count+0, 1 
;Practica7c.c,30 :: 		}
L_interrupt2:
;Practica7c.c,31 :: 		funcion();
	CALL        _funcion+0, 0
;Practica7c.c,32 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica7c.c,33 :: 		}
L_interrupt0:
;Practica7c.c,35 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt3
;Practica7c.c,37 :: 		TMR0H = (3336 >>8);
	MOVLW       13
	MOVWF       TMR0H+0 
;Practica7c.c,38 :: 		TMR0L = 3336;
	MOVLW       8
	MOVWF       TMR0L+0 
;Practica7c.c,39 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Practica7c.c,40 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;Practica7c.c,41 :: 		}
L_interrupt3:
;Practica7c.c,42 :: 		if(PIR1.ADIF)   {
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt4
;Practica7c.c,43 :: 		funcion();
	CALL        _funcion+0, 0
;Practica7c.c,44 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica7c.c,46 :: 		}
L_interrupt4:
;Practica7c.c,47 :: 		}
L_end_interrupt:
L__interrupt14:
	RETFIE      1
; end of _interrupt

_funcion:

;Practica7c.c,49 :: 		void funcion()
;Practica7c.c,51 :: 		aux = (ADRESL >> 6);
	MOVLW       6
	MOVWF       R0 
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
	MOVF        R0, 0 
L__funcion16:
	BZ          L__funcion17
	RRCF        _aux+0, 1 
	BCF         _aux+0, 7 
	ADDLW       255
	GOTO        L__funcion16
L__funcion17:
	MOVLW       0
	MOVWF       _aux+1 
;Practica7c.c,52 :: 		aux = aux + (ADRESH << 2);
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
	MOVF        R0, 0 
	ADDWF       _aux+0, 1 
	MOVF        R1, 0 
	ADDWFC      _aux+1, 1 
;Practica7c.c,53 :: 		if (count==1){
	MOVF        _count+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion5
;Practica7c.c,54 :: 		num = aux*4.8875e-1;
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
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
;Practica7c.c,55 :: 		}
L_funcion5:
;Practica7c.c,56 :: 		if (count==2){
	MOVF        _count+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion6
;Practica7c.c,57 :: 		num = aux*4.8875e-1+273.15;
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
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
	MOVLW       51
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica7c.c,58 :: 		}
L_funcion6:
;Practica7c.c,59 :: 		if (count==3){
	MOVF        _count+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion7
;Practica7c.c,60 :: 		num = aux*4.8875e-1*1.8+32.0;
	MOVF        _aux+0, 0 
	MOVWF       R0 
	MOVF        _aux+1, 0 
	MOVWF       R1 
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
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica7c.c,61 :: 		}
L_funcion7:
;Practica7c.c,62 :: 		FloatToStr (num, txt);
	MOVF        _num+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _num+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _num+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _num+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Practica7c.c,63 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Practica7c.c,64 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica7c.c,66 :: 		if (count==1){
	MOVF        _count+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion8
;Practica7c.c,67 :: 		Lcd_Chr_CP('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;Practica7c.c,68 :: 		}
L_funcion8:
;Practica7c.c,69 :: 		if (count==2){
	MOVF        _count+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion9
;Practica7c.c,70 :: 		Lcd_Chr_CP('K');
	MOVLW       75
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;Practica7c.c,71 :: 		}
L_funcion9:
;Practica7c.c,72 :: 		if (count==3){
	MOVF        _count+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion10
;Practica7c.c,73 :: 		Lcd_Chr_CP('F');
	MOVLW       70
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;Practica7c.c,74 :: 		}
L_funcion10:
;Practica7c.c,75 :: 		}
L_end_funcion:
	RETURN      0
; end of _funcion

_main:

;Practica7c.c,77 :: 		void main() {
;Practica7c.c,78 :: 		TRISE = 0x01;
	MOVLW       1
	MOVWF       TRISE+0 
;Practica7c.c,79 :: 		PORTE = 0x00;
	CLRF        PORTE+0 
;Practica7c.c,80 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica7c.c,81 :: 		ADRESL = 0x00;
	CLRF        ADRESL+0 
;Practica7c.c,82 :: 		ADRESH = 0x00;
	CLRF        ADRESH+0 
;Practica7c.c,84 :: 		TRISB.B0 = 1; //se configura RB0 como entrada
	BSF         TRISB+0, 0 
;Practica7c.c,85 :: 		INTCON.PEIE = 0; //es de tipo core
	BCF         INTCON+0, 6 
;Practica7c.c,86 :: 		RCON.IPEN = 0; //se deshabilitan las interrupciones con prioridad (MikroC)
	BCF         RCON+0, 7 
;Practica7c.c,87 :: 		INTCON2.INTEDG0 = x; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BTFSC       _x+0, 0 
	GOTO        L__main19
	BCF         INTCON2+0, 6 
	GOTO        L__main20
L__main19:
	BSF         INTCON2+0, 6 
L__main20:
;Practica7c.c,88 :: 		INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
	BCF         INTCON+0, 1 
;Practica7c.c,89 :: 		INTCON.INT0IE = 1; // se habilita la interrupción INT0
	BSF         INTCON+0, 4 
;Practica7c.c,90 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Practica7c.c,92 :: 		INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
	BCF         INTCON2+0, 7 
;Practica7c.c,93 :: 		ADCON1 = 0x00;
	CLRF        ADCON1+0 
;Practica7c.c,94 :: 		ADCON0 = 0x75;
	MOVLW       117
	MOVWF       ADCON0+0 
;Practica7c.c,95 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica7c.c,96 :: 		PIE1.ADIE=1;
	BSF         PIE1+0, 6 
;Practica7c.c,97 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica7c.c,98 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica7c.c,100 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica7c.c,101 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica7c.c,102 :: 		T0CON = 0x85;
	MOVLW       133
	MOVWF       T0CON+0 
;Practica7c.c,103 :: 		TMR0H = (3336 >>8);
	MOVLW       13
	MOVWF       TMR0H+0 
;Practica7c.c,104 :: 		TMR0L = 3336;
	MOVLW       8
	MOVWF       TMR0L+0 
;Practica7c.c,106 :: 		while(1);
L_main11:
	GOTO        L_main11
;Practica7c.c,107 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
