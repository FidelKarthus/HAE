#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica4/MyProject.c"
short primero = 0;

void interrupt(){
 if (primero==0){
 PORTC.B1 = 0;
 delay_ms(100);
 PORTC.B3 = 1;
 delay_ms(100);
 PORTC.B2 = 0;
 delay_ms(100);
 PORTC.B0 = 1;
 delay_ms(100);
 PORTC.B3 = 0;
 delay_ms(100);
 PORTC.B1 = 1;
 primero = 1;
 }else
 {
 PORTC.B1 = 0;
 delay_ms(100);
 PORTC.B3 = 1;
 delay_ms(100);
 PORTC.B0 = 0;
 delay_ms(100);
 PORTC.B2 = 1;
 delay_ms(100);
 PORTC.B3 = 0;
 delay_ms(100);
 PORTC.B1 = 1;
 primero = 1;
 PORTC.B2 = 0;
 delay_ms(100);
 PORTC.B0 = 1;
 delay_ms(100);
 PORTC.B1 = 0;
 delay_ms(100);
 PORTC.B3 = 1;
 delay_ms(100);
 PORTC.B0 = 0;
 delay_ms(100);
 PORTC.B2 = 1;
 primero = 1;
 PORTC.B3 = 0;
 delay_ms(100);
 PORTC.B1 = 1;
 delay_ms(100);
 PORTC.B2 = 0;
 delay_ms(100);
 PORTC.B0 = 1;
 }

 INTCON.INT0IF=0;
}

void main() {
 TRISC = 0;
 PORTC = 0x00;
 INTCON2.RBPU=0;
 TRISB=1;
 INTCON.INT0IF = 0;
 INTCON2.INTEDG0=1;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;
 PORTC.B0 = 1;
 PORTC.B0 = 0;
 PORTC.B1 = 1;
 PORTC.B2 = 1;
 while(1);

}
