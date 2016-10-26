
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		short aux=0;
	CLRF        main_aux_L0+0 
;MyProject.c,3 :: 		RBPU_BIT=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;MyProject.c,4 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;MyProject.c,5 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;MyProject.c,8 :: 		while(1)
L_main0:
;MyProject.c,10 :: 		if((PORTB.B0==0)&&(aux == 0))
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	MOVF        main_aux_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main11:
;MyProject.c,12 :: 		aux = 1;
	MOVLW       1
	MOVWF       main_aux_L0+0 
;MyProject.c,13 :: 		}else if(PORTB.B0==1 && aux==1)
	GOTO        L_main5
L_main4:
	BTFSS       PORTB+0, 0 
	GOTO        L_main8
	MOVF        main_aux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main10:
;MyProject.c,15 :: 		PORTB.B1=!PORTB.B1;
	BTG         PORTB+0, 1 
;MyProject.c,16 :: 		aux=0;
	CLRF        main_aux_L0+0 
;MyProject.c,17 :: 		}
L_main8:
L_main5:
;MyProject.c,18 :: 		DELAY_MS(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;MyProject.c,19 :: 		}
	GOTO        L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
