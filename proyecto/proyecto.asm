
_interrupt:

;proyecto.c,19 :: 		void interrupt() //se ha pulsado una tecla
;proyecto.c,21 :: 		num = num*16570;
	MOVLW       186
	MULWF       _num+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _num+0 
;proyecto.c,22 :: 		ByteToStr (num, txt);
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;proyecto.c,23 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;proyecto.c,25 :: 		x=PORTB; //hay que leer el puerto B para poder borrar el bit RBIF (define x global)
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;proyecto.c,26 :: 		INTCON.RBIF=0;//Al borrar el bit RBIF despues de llamar a la funcion tecla, nos
	BCF         INTCON+0, 0 
;proyecto.c,27 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;proyecto.c,29 :: 		void main() {
;proyecto.c,30 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;proyecto.c,31 :: 		TRISB = 0x10;
	MOVLW       16
	MOVWF       TRISB+0 
;proyecto.c,32 :: 		PORTB = 0;
	CLRF        PORTB+0 
;proyecto.c,33 :: 		PORTB = 0x01;
	MOVLW       1
	MOVWF       PORTB+0 
;proyecto.c,34 :: 		DELAY_MS(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;proyecto.c,35 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;proyecto.c,37 :: 		INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
	BCF         INTCON2+0, 7 
;proyecto.c,38 :: 		x=PORTB;//para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;proyecto.c,39 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;proyecto.c,40 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;proyecto.c,41 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;proyecto.c,43 :: 		while(1){
L_main1:
;proyecto.c,45 :: 		}
	GOTO        L_main1
;proyecto.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
