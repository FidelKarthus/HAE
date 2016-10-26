
_interrupt:

;MyProject.c,1 :: 		void interrupt()
;MyProject.c,3 :: 		PORTB.B1 = ! PORTB.B1;
	BTG         PORTB+0, 1 
;MyProject.c,4 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;MyProject.c,6 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,8 :: 		void main() {
;MyProject.c,10 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;MyProject.c,11 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;MyProject.c,12 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;MyProject.c,13 :: 		PORTB.B1=1;
	BSF         PORTB+0, 1 
;MyProject.c,14 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;MyProject.c,15 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;MyProject.c,16 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;MyProject.c,17 :: 		while(1)
L_main0:
;MyProject.c,19 :: 		asm nop;
	NOP
;MyProject.c,20 :: 		}
	GOTO        L_main0
;MyProject.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
