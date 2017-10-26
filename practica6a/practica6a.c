/* Practicing interruptuios and using counters*/
void interrupt() // rutina de servicio de la interrupci�n (MikroC)
{
        if(PORTC.B0 == 1)   {
                T0CON = 0xc1;
                TMR0L = 106;
        }
        else {
                T0CON = 0xc2;
                TMR0L = 81;
        }
        PORTC.B0 = !PORTC.B0;
        INTCON.TMR0IF = 0; // se borra el flag
        PORTC.B7 = 1;
}
void main()
{
        TRISC = 0x00;
        PORTC=0;

        T0CON = 0xc1;
        INTCON.PEIE = 0; // es una interrupci�n de tipo core
        RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad
        INTCON.TMR0IF = 0; // se pone el flag a 0
        INTCON.TMR0IE = 1; // se habilita la interrupci�n del Timer 0
        TMR0L = 106; //se carga el valor inicial (alfa) del �contador�
        INTCON.GIE = 1; // se habilitan las interrupciones en general
// hay que poner a contar el Timer0
        T0CON.TMR0ON=1;
        PORTC.B0 = 1;
        while(1) ;
}
