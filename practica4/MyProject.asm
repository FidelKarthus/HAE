
_interrupt:

;MyProject.c,3 :: 		void interrupt(){
;MyProject.c,4 :: 		if (primero==0){
	MOVF        _primero+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;MyProject.c,5 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;MyProject.c,6 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
;MyProject.c,7 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;MyProject.c,8 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	DECFSZ      R11, 1, 1
	BRA         L_interrupt2
	NOP
;MyProject.c,9 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;MyProject.c,10 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
	NOP
;MyProject.c,11 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,12 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
	NOP
;MyProject.c,13 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;MyProject.c,14 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	DECFSZ      R11, 1, 1
	BRA         L_interrupt5
	NOP
;MyProject.c,15 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,16 :: 		primero = 1;
	MOVLW       1
	MOVWF       _primero+0 
;MyProject.c,17 :: 		}else
	GOTO        L_interrupt6
L_interrupt0:
;MyProject.c,19 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;MyProject.c,20 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt7:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt7
	DECFSZ      R12, 1, 1
	BRA         L_interrupt7
	DECFSZ      R11, 1, 1
	BRA         L_interrupt7
	NOP
;MyProject.c,21 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;MyProject.c,22 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt8:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt8
	DECFSZ      R12, 1, 1
	BRA         L_interrupt8
	DECFSZ      R11, 1, 1
	BRA         L_interrupt8
	NOP
;MyProject.c,23 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;MyProject.c,24 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
	NOP
;MyProject.c,25 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;MyProject.c,26 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt10:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt10
	DECFSZ      R12, 1, 1
	BRA         L_interrupt10
	DECFSZ      R11, 1, 1
	BRA         L_interrupt10
	NOP
;MyProject.c,27 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;MyProject.c,28 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt11:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt11
	DECFSZ      R12, 1, 1
	BRA         L_interrupt11
	DECFSZ      R11, 1, 1
	BRA         L_interrupt11
	NOP
;MyProject.c,29 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,30 :: 		primero = 1;
	MOVLW       1
	MOVWF       _primero+0 
;MyProject.c,31 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;MyProject.c,32 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt12:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt12
	DECFSZ      R12, 1, 1
	BRA         L_interrupt12
	DECFSZ      R11, 1, 1
	BRA         L_interrupt12
	NOP
;MyProject.c,33 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,34 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt13:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt13
	DECFSZ      R12, 1, 1
	BRA         L_interrupt13
	DECFSZ      R11, 1, 1
	BRA         L_interrupt13
	NOP
;MyProject.c,35 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;MyProject.c,36 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt14:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt14
	DECFSZ      R12, 1, 1
	BRA         L_interrupt14
	DECFSZ      R11, 1, 1
	BRA         L_interrupt14
	NOP
;MyProject.c,37 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;MyProject.c,38 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt15:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt15
	DECFSZ      R12, 1, 1
	BRA         L_interrupt15
	DECFSZ      R11, 1, 1
	BRA         L_interrupt15
	NOP
;MyProject.c,39 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;MyProject.c,40 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt16:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt16
	DECFSZ      R12, 1, 1
	BRA         L_interrupt16
	DECFSZ      R11, 1, 1
	BRA         L_interrupt16
	NOP
;MyProject.c,41 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;MyProject.c,42 :: 		primero = 1;
	MOVLW       1
	MOVWF       _primero+0 
;MyProject.c,43 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;MyProject.c,44 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt17:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt17
	DECFSZ      R12, 1, 1
	BRA         L_interrupt17
	DECFSZ      R11, 1, 1
	BRA         L_interrupt17
	NOP
;MyProject.c,45 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,46 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt18:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt18
	DECFSZ      R12, 1, 1
	BRA         L_interrupt18
	DECFSZ      R11, 1, 1
	BRA         L_interrupt18
	NOP
;MyProject.c,47 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;MyProject.c,48 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt19:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt19
	DECFSZ      R12, 1, 1
	BRA         L_interrupt19
	DECFSZ      R11, 1, 1
	BRA         L_interrupt19
	NOP
;MyProject.c,49 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,50 :: 		}
L_interrupt6:
;MyProject.c,52 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;MyProject.c,53 :: 		}
L_end_interrupt:
L__interrupt23:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,55 :: 		void main() {
;MyProject.c,56 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,57 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;MyProject.c,58 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;MyProject.c,59 :: 		TRISB=1;
	MOVLW       1
	MOVWF       TRISB+0 
;MyProject.c,60 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;MyProject.c,61 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;MyProject.c,62 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;MyProject.c,63 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;MyProject.c,64 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,65 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;MyProject.c,66 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,67 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;MyProject.c,68 :: 		while(1);
L_main20:
	GOTO        L_main20
;MyProject.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
