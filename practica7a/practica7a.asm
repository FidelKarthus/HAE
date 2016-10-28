
_interrupt:

;practica7a.c,21 :: 		void interrupt() //se ha pulsado una tecla
;practica7a.c,23 :: 		aux = (ADRESL >> 6);
	MOVLW       6
	MOVWF       R0 
	MOVF        ADRESL+0, 0 
	MOVWF       _aux+0 
	MOVLW       0
	MOVWF       _aux+1 
	MOVF        R0, 0 
L__interrupt5:
	BZ          L__interrupt6
	RRCF        _aux+0, 1 
	BCF         _aux+0, 7 
	ADDLW       255
	GOTO        L__interrupt5
L__interrupt6:
	MOVLW       0
	MOVWF       _aux+1 
;practica7a.c,24 :: 		aux = aux + (ADRESH << 2);
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
;practica7a.c,25 :: 		num = aux*0.00488758;
	CALL        _word2double+0, 0
	MOVLW       254
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       119
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
;practica7a.c,26 :: 		FloatToStr (num, txt);
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
;practica7a.c,27 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica7a.c,28 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;practica7a.c,29 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;practica7a.c,30 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;practica7a.c,31 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;practica7a.c,33 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;practica7a.c,35 :: 		void main() {
;practica7a.c,36 :: 		TRISA = 0x01;
	MOVLW       1
	MOVWF       TRISA+0 
;practica7a.c,37 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;practica7a.c,38 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;practica7a.c,39 :: 		ADRESL = 0x00;
	CLRF        ADRESL+0 
;practica7a.c,40 :: 		ADRESH = 0x00;
	CLRF        ADRESH+0 
;practica7a.c,42 :: 		INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
	BCF         INTCON2+0, 7 
;practica7a.c,45 :: 		ADCON1 = 0x0E;
	MOVLW       14
	MOVWF       ADCON1+0 
;practica7a.c,46 :: 		ADCON0 = 0x45;
	MOVLW       69
	MOVWF       ADCON0+0 
;practica7a.c,47 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;practica7a.c,48 :: 		PIE1.ADIE=1;
	BSF         PIE1+0, 6 
;practica7a.c,49 :: 		IPR1.ADIP=0;
	BCF         IPR1+0, 6 
;practica7a.c,50 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;practica7a.c,51 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;practica7a.c,52 :: 		ADCON0.B2=1;
	BSF         ADCON0+0, 2 
;practica7a.c,53 :: 		while(1);
L_main1:
	GOTO        L_main1
;practica7a.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
