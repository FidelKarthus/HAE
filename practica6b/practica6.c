int aux=0;
short first=0;
void interrupt() // rutina de servicio de la interrupción (MikroC)
{
   if(INTCON3.INT1IF)   {
      T0CON = 0x84;
      TMR0H = (3036 >>8);
      TMR0L = 3036;
      PORTC.B0=1;
      INTCON3.INT1IE = 0;
   }
   if(INTCON.TMR0IF)   {
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
INTCON3.INT1IF = 0; // se borra el flag de la interrupción INT1
INTCON.TMR0IF = 0; // se pone el flag a 0
PORTC.B7 = !PORTC.B7;

}

void main()
{
TRISC = 0x00;
PORTC = 0;

TRISB = 0x02; // se configura RB1 como entrada
PORTB=0;

INTCON.PEIE = 0; // es una interrupción de tipo core
RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
INTCON.TMR0IF = 0; // se pone el flag a 0
INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0

// hay que poner a contar el Timer0


RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad (MikroC)
INTCON2.INTEDG1 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
INTCON3.INT1IF = 0; // se pone el flag de la interrupción INT1 a 0
INTCON3.INT1IE = 1; // se habilita la interrupción INT1
INTCON.GIE = 1; // se habilitan las interrupciones en general


while(1);
}