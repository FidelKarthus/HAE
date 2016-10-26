
_main:

;practica2.c,2 :: 		void main() {
;practica2.c,4 :: 		char array[]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
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
	CLRF        main_u_L0+0 
	CLRF        main_d_L0+0 
	CLRF        main_t_L0+0 
;practica2.c,8 :: 		TRISC = 0X00;
	CLRF        TRISC+0 
;practica2.c,9 :: 		TRISD = 0X00;
	CLRF        TRISD+0 
;practica2.c,10 :: 		PORTC = 0X00;
	CLRF        PORTC+0 
;practica2.c,11 :: 		PORTD = 0X03;//apagados
	MOVLW       3
	MOVWF       PORTD+0 
;practica2.c,13 :: 		while(1)
L_main0:
;practica2.c,15 :: 		for (u=0; u <= 9; u++ )
	CLRF        main_u_L0+0 
L_main2:
	MOVLW       128
	XORLW       9
	MOVWF       R0 
	MOVLW       128
	XORWF       main_u_L0+0, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;practica2.c,17 :: 		for (t=0; t < 25; t++ )
	CLRF        main_t_L0+0 
L_main5:
	MOVLW       128
	XORWF       main_t_L0+0, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       25
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;practica2.c,19 :: 		PORTD = 0X02;
	MOVLW       2
	MOVWF       PORTD+0 
;practica2.c,20 :: 		PORTC = array[d];
	MOVLW       main_array_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_array_L0+0)
	MOVWF       FSR0H 
	MOVF        main_d_L0+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       main_d_L0+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;practica2.c,21 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;practica2.c,22 :: 		PORTD = 0X01;
	MOVLW       1
	MOVWF       PORTD+0 
;practica2.c,23 :: 		PORTC = array[u];
	MOVLW       main_array_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_array_L0+0)
	MOVWF       FSR0H 
	MOVF        main_u_L0+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       main_u_L0+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;practica2.c,24 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;practica2.c,17 :: 		for (t=0; t < 25; t++ )
	INCF        main_t_L0+0, 1 
;practica2.c,25 :: 		}
	GOTO        L_main5
L_main6:
;practica2.c,15 :: 		for (u=0; u <= 9; u++ )
	INCF        main_u_L0+0, 1 
;practica2.c,26 :: 		}
	GOTO        L_main2
L_main3:
;practica2.c,27 :: 		d+=1;
	INCF        main_d_L0+0, 1 
;practica2.c,28 :: 		if(d==6) {
	MOVF        main_d_L0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;practica2.c,29 :: 		d=0;
	CLRF        main_d_L0+0 
;practica2.c,30 :: 		}
L_main10:
;practica2.c,33 :: 		}
	GOTO        L_main0
;practica2.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
