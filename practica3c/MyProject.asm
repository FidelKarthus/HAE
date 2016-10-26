
_interrupt:

;MyProject.c,4 :: 		void interrupt()
;MyProject.c,7 :: 		u++;
	INCF        _u+0, 1 
;MyProject.c,9 :: 		if(t==9) {
	MOVF        _t+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;MyProject.c,10 :: 		t=0;
	CLRF        _t+0 
;MyProject.c,11 :: 		}
L_interrupt0:
;MyProject.c,12 :: 		if(u==10){
	MOVF        _u+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;MyProject.c,13 :: 		u=0;
	CLRF        _u+0 
;MyProject.c,14 :: 		t++;
	INCF        _t+0, 1 
;MyProject.c,16 :: 		}
L_interrupt1:
;MyProject.c,17 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;MyProject.c,19 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,22 :: 		void main() {
;MyProject.c,24 :: 		char array[]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
	MOVLW       63
	MOVWF       main_array_L0+0 
	MOVLW       6
	MOVWF       main_array_L0+1 
	MOVLW       91
	MOVWF       main_array_L0+2 
	MOVLW       79
	MOVWF       main_array_L0+3 
	MOVLW       102
	MOVWF       main_array_L0+4 
	MOVLW       109
	MOVWF       main_array_L0+5 
	MOVLW       125
	MOVWF       main_array_L0+6 
	MOVLW       7
	MOVWF       main_array_L0+7 
	MOVLW       127
	MOVWF       main_array_L0+8 
	MOVLW       103
	MOVWF       main_array_L0+9 
;MyProject.c,25 :: 		TRISA = 0X00;
	CLRF        TRISA+0 
;MyProject.c,26 :: 		TRISD = 0X00;
	CLRF        TRISD+0 
;MyProject.c,27 :: 		PORTD = 0X03;//apagados
	MOVLW       3
	MOVWF       PORTD+0 
;MyProject.c,28 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;MyProject.c,29 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;MyProject.c,30 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;MyProject.c,31 :: 		PORTB.B1=1;
	BSF         PORTB+0, 1 
;MyProject.c,32 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;MyProject.c,33 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;MyProject.c,34 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;MyProject.c,36 :: 		while(1)
L_main2:
;MyProject.c,38 :: 		PORTA=0X01  ;
	MOVLW       1
	MOVWF       PORTA+0 
;MyProject.c,39 :: 		PORTD = array[t];
	MOVLW       main_array_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_array_L0+0)
	MOVWF       FSR0H 
	MOVF        _t+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       _t+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;MyProject.c,40 :: 		DELAY_MS(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;MyProject.c,41 :: 		PORTA=0X02;
	MOVLW       2
	MOVWF       PORTA+0 
;MyProject.c,42 :: 		PORTD = array[u];
	MOVLW       main_array_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_array_L0+0)
	MOVWF       FSR0H 
	MOVF        _u+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       _u+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;MyProject.c,43 :: 		DELAY_MS(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;MyProject.c,45 :: 		}
	GOTO        L_main2
;MyProject.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
