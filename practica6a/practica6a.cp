#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica6a/practica6a.c"
void interrupt()
{
 if(PORTC.B0 == 1) {
 T0CON = 0xc1;
 TMR0L = 106;
 }
 else {
 T0CON = 0xc2;
 TMR0L = 81;
 }
 PORTC.B0 = !PORTC.B0;
INTCON.TMR0IF = 0;
PORTC.B7 = 1;
}
void main()
{
TRISC = 0x00;
PORTC=0;

T0CON = 0xc1;
INTCON.PEIE = 0;
RCON.IPEN = 0;
INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;
TMR0L = 106;
INTCON.GIE = 1;

T0CON.TMR0ON=1;
PORTC.B0 = 1;
while(1);
}
