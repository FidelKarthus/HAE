
_interrupt:

;Practica8a.c,23 :: 		void interrupt() //se ha pulsado una tecla
;Practica8a.c,25 :: 		if(INTCON3.INT2IF)   {
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt0
;Practica8a.c,26 :: 		if (count == 8){
	MOVF        _count+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;Practica8a.c,27 :: 		count = 1;
	MOVLW       1
	MOVWF       _count+0 
;Practica8a.c,28 :: 		} else {
	GOTO        L_interrupt2
L_interrupt1:
;Practica8a.c,29 :: 		count++;
	INCF        _count+0, 1 
;Practica8a.c,30 :: 		}
L_interrupt2:
;Practica8a.c,31 :: 		funcion();
	CALL        _funcion+0, 0
;Practica8a.c,32 :: 		INTCON3.INT2IF = 0;
	BCF         INTCON3+0, 1 
;Practica8a.c,33 :: 		}
L_interrupt0:
;Practica8a.c,35 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt3
;Practica8a.c,37 :: 		TMR0H = (3036 >>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica8a.c,38 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica8a.c,39 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Practica8a.c,40 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;Practica8a.c,41 :: 		}
L_interrupt3:
;Practica8a.c,42 :: 		if(PIR1.ADIF)   {
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt4
;Practica8a.c,43 :: 		funcion();
	CALL        _funcion+0, 0
;Practica8a.c,44 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica8a.c,46 :: 		}
L_interrupt4:
;Practica8a.c,47 :: 		}
L_end_interrupt:
L__interrupt23:
	RETFIE      1
; end of _interrupt

_funcion:

;Practica8a.c,49 :: 		void funcion()
;Practica8a.c,51 :: 		aux = (ADRESL >> 6);
	MOVLW       6
	MOVWF       R0 
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
	MOVF        R0, 0 
L__funcion25:
	BZ          L__funcion26
	RRCF        _aux+0, 1 
	BCF         _aux+0, 7 
	ADDLW       255
	GOTO        L__funcion25
L__funcion26:
	MOVLW       0
	MOVWF       _aux+1 
;Practica8a.c,52 :: 		aux = aux + (ADRESH << 2);
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
;Practica8a.c,53 :: 		num = (aux*0.1085025+10.5);
	CALL        _word2double+0, 0
	MOVLW       143
	MOVWF       R4 
	MOVLW       54
	MOVWF       R5 
	MOVLW       94
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       40
	MOVWF       R6 
	MOVLW       130
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
;Practica8a.c,55 :: 		if (count==2){
	MOVF        _count+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion5
;Practica8a.c,56 :: 		num = num/6.8927;
	MOVLW       0
	MOVWF       R4 
	MOVLW       145
	MOVWF       R5 
	MOVLW       92
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,57 :: 		}
L_funcion5:
;Practica8a.c,58 :: 		if (count==3){
	MOVF        _count+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion6
;Practica8a.c,59 :: 		num = num/101.325;
	MOVLW       102
	MOVWF       R4 
	MOVLW       166
	MOVWF       R5 
	MOVLW       74
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,60 :: 		}
L_funcion6:
;Practica8a.c,61 :: 		if (count==4){
	MOVF        _count+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion7
;Practica8a.c,62 :: 		num = num/0.1;
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,63 :: 		}
L_funcion7:
;Practica8a.c,64 :: 		if (count==5){
	MOVF        _count+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion8
;Practica8a.c,65 :: 		num = num/0.13328;
	MOVLW       141
	MOVWF       R4 
	MOVLW       122
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,66 :: 		}
L_funcion8:
;Practica8a.c,67 :: 		if (count==6){
	MOVF        _count+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion9
;Practica8a.c,68 :: 		num = num/0.001;
	MOVLW       111
	MOVWF       R4 
	MOVLW       18
	MOVWF       R5 
	MOVLW       3
	MOVWF       R6 
	MOVLW       117
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,69 :: 		}
L_funcion9:
;Practica8a.c,70 :: 		if (count==7){
	MOVF        _count+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion10
;Practica8a.c,71 :: 		num = num/98.039;
	MOVLW       248
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       68
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,72 :: 		}
L_funcion10:
;Practica8a.c,73 :: 		if (count==8){
	MOVF        _count+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion11
;Practica8a.c,74 :: 		num = num/9.81;
	MOVLW       195
	MOVWF       R4 
	MOVLW       245
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVF        _num+2, 0 
	MOVWF       R2 
	MOVF        _num+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVF        R1, 0 
	MOVWF       _num+1 
	MOVF        R2, 0 
	MOVWF       _num+2 
	MOVF        R3, 0 
	MOVWF       _num+3 
;Practica8a.c,75 :: 		}
L_funcion11:
;Practica8a.c,77 :: 		FloatToStr (num, txt);
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
;Practica8a.c,78 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Practica8a.c,79 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica8a.c,81 :: 		if (count==1){
	MOVF        _count+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion12
;Practica8a.c,82 :: 		Lcd_Out_CP("Kpa");
	MOVLW       ?lstr1_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,83 :: 		}
L_funcion12:
;Practica8a.c,84 :: 		if (count==2){
	MOVF        _count+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion13
;Practica8a.c,85 :: 		Lcd_Out_CP("Psi");
	MOVLW       ?lstr2_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,86 :: 		}
L_funcion13:
;Practica8a.c,87 :: 		if (count==3){
	MOVF        _count+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion14
;Practica8a.c,88 :: 		Lcd_Out_CP("Atm");
	MOVLW       ?lstr3_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,89 :: 		}
L_funcion14:
;Practica8a.c,90 :: 		if (count==4){
	MOVF        _count+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion15
;Practica8a.c,91 :: 		Lcd_Out_CP("mBar");
	MOVLW       ?lstr4_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,92 :: 		}
L_funcion15:
;Practica8a.c,93 :: 		if (count==5){
	MOVF        _count+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion16
;Practica8a.c,94 :: 		Lcd_Out_CP("mmHg");
	MOVLW       ?lstr5_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,95 :: 		}
L_funcion16:
;Practica8a.c,96 :: 		if (count==6){
	MOVF        _count+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion17
;Practica8a.c,97 :: 		Lcd_Out_CP("N/m2");
	MOVLW       ?lstr6_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,98 :: 		}
L_funcion17:
;Practica8a.c,99 :: 		if (count==7){
	MOVF        _count+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion18
;Practica8a.c,100 :: 		Lcd_Out_CP("Kg/cm2");
	MOVLW       ?lstr7_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,101 :: 		}
L_funcion18:
;Practica8a.c,102 :: 		if (count==8){
	MOVF        _count+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_funcion19
;Practica8a.c,103 :: 		Lcd_Out_CP("kp/cm^2");
	MOVLW       ?lstr8_Practica8a+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_Practica8a+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Practica8a.c,104 :: 		}
L_funcion19:
;Practica8a.c,105 :: 		}
L_end_funcion:
	RETURN      0
; end of _funcion

_main:

;Practica8a.c,107 :: 		void main() {
;Practica8a.c,108 :: 		TRISE = 0x01;
	MOVLW       1
	MOVWF       TRISE+0 
;Practica8a.c,109 :: 		PORTE = 0x00;
	CLRF        PORTE+0 
;Practica8a.c,110 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica8a.c,111 :: 		ADRESL = 0x00;
	CLRF        ADRESL+0 
;Practica8a.c,112 :: 		ADRESH = 0x00;
	CLRF        ADRESH+0 
;Practica8a.c,114 :: 		TRISB.B2 = 1; // se configura RB1 como entrada
	BSF         TRISB+0, 2 
;Practica8a.c,115 :: 		INTCON.PEIE = 0; // es de tipo core
	BCF         INTCON+0, 6 
;Practica8a.c,116 :: 		RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad (MikroC)
	BCF         RCON+0, 7 
;Practica8a.c,117 :: 		INTCON2.INTEDG2 = x; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BTFSC       _x+0, 0 
	GOTO        L__main28
	BCF         INTCON2+0, 4 
	GOTO        L__main29
L__main28:
	BSF         INTCON2+0, 4 
L__main29:
;Practica8a.c,118 :: 		INTCON3.INT2IF = 0; // se pone el flag de la interrupción INT2 a 0
	BCF         INTCON3+0, 1 
;Practica8a.c,119 :: 		INTCON3.INT2IE = 1; // se habilita la interrupción INT2
	BSF         INTCON3+0, 4 
;Practica8a.c,120 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Practica8a.c,122 :: 		INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
	BCF         INTCON2+0, 7 
;Practica8a.c,123 :: 		ADCON1 = 0x09;
	MOVLW       9
	MOVWF       ADCON1+0 
;Practica8a.c,124 :: 		ADCON0 = 0xAD;
	MOVLW       173
	MOVWF       ADCON0+0 
;Practica8a.c,125 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;Practica8a.c,126 :: 		PIE1.ADIE=1;
	BSF         PIE1+0, 6 
;Practica8a.c,127 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica8a.c,128 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica8a.c,130 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;Practica8a.c,131 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Practica8a.c,132 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;Practica8a.c,133 :: 		TMR0H = (3036 >>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;Practica8a.c,134 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;Practica8a.c,136 :: 		while(1);
L_main20:
	GOTO        L_main20
;Practica8a.c,137 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
