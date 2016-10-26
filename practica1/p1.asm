
_main:

;p1.c,2 :: 		void main() {
;p1.c,3 :: 		TRISC = 0X00;
	CLRF        TRISC+0 
;p1.c,4 :: 		PORTC = 0X01;
	MOVLW       1
	MOVWF       PORTC+0 
;p1.c,5 :: 		while(1)
L_main0:
;p1.c,7 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;p1.c,8 :: 		PORTC = (PORTC << 1);
	MOVF        PORTC+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;p1.c,9 :: 		DELAY_MS(100);
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
;p1.c,10 :: 		if (PORTC == 0X00){
	MOVF        PORTC+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;p1.c,11 :: 		PORTC = 0X01;
	MOVLW       1
	MOVWF       PORTC+0 
;p1.c,12 :: 		}
L_main4:
;p1.c,13 :: 		}
	GOTO        L_main0
;p1.c,14 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
