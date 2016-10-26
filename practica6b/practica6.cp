#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica6b/practica6.c"
int aux=0;
short first=0;
void interrupt()
{
 if(INTCON3.INT1IF) {
 T0CON = 0x84;
 TMR0H = (3036 >>8);
 TMR0L = 3036;
 PORTC.B0=1;
 INTCON3.INT1IE = 0;
 }
 if(INTCON.TMR0IF) {
 TMR0H = (3036 >>8);
 TMR0L = 3036;
 aux++;
 if(aux==5)
 {
 PORTC.B0=0;
 T0CON.TMR0ON=0;
 INTCON3.INT1IE = 1;
 }
}
INTCON3.INT1IF = 0;
INTCON.TMR0IF = 0;
PORTC.B7 = !PORTC.B7;

}

void main()
{
TRISC = 0x00;
PORTC = 0;

TRISB = 0x02;
PORTB=0;

INTCON.PEIE = 0;
RCON.IPEN = 0;
INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;




RCON.IPEN = 0;
INTCON2.INTEDG1 = 1;
INTCON3.INT1IF = 0;
INTCON3.INT1IE = 1;
INTCON.GIE = 1;


while(1);
}
