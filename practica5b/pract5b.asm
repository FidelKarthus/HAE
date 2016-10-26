
_interrupt:

;pract5b.c,21 :: 		void interrupt() //se ha pulsado una tecla
;pract5b.c,23 :: 		if(aux)
	MOVF        _aux+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt0
;pract5b.c,25 :: 		ByteToStr (num, txt);
	MOVF        _num+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;pract5b.c,26 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;pract5b.c,27 :: 		num++;
	INCF        _num+0, 1 
;pract5b.c,28 :: 		if(num == 100)
	MOVF        _num+0, 0 
	XORLW       100
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;pract5b.c,29 :: 		num = 0;
	CLRF        _num+0 
L_interrupt1:
;pract5b.c,30 :: 		}
L_interrupt0:
;pract5b.c,31 :: 		aux=!aux;
	MOVF        _aux+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       _aux+0 
;pract5b.c,32 :: 		x=PORTB; //hay que leer el puerto B para poder borrar el bit RBIF (define x global)
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;pract5b.c,33 :: 		INTCON.RBIF=0;//Al borrar el bit RBIF despues de llamar a la funcion tecla, nos
	BCF         INTCON+0, 0 
;pract5b.c,34 :: 		}           //aseguramos que después de soltar la tecla éste bit se pone a 0.
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;pract5b.c,39 :: 		void main() {
;pract5b.c,40 :: 		TRISB=0x10;
	MOVLW       16
	MOVWF       TRISB+0 
;pract5b.c,41 :: 		PORTB=0;
	CLRF        PORTB+0 
;pract5b.c,42 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;pract5b.c,44 :: 		INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
	BCF         INTCON2+0, 7 
;pract5b.c,45 :: 		x=PORTB;//para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;pract5b.c,46 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;pract5b.c,47 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;pract5b.c,48 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;pract5b.c,49 :: 		while(1);
L_main2:
	GOTO        L_main2
;pract5b.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
