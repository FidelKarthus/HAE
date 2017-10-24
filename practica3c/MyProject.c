/* Using interruptions with a more useful example */
short u = 0;
short t = 0;

void interrupt()
{

        u++;

        if(t==10) {
                t=0;
        }
        if(u==10) {
                u=0;
                t++;

        }
        INTCON.INT0IF=0;

}


void main() {

        char array[]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
        TRISA = 0X00;
        TRISD = 0X00;
        PORTD = 0X03;//apagados
        INTCON2.RBPU=0;
        TRISB.B0=1;
        TRISB.B1=0;
        PORTB.B1=1;
        INTCON.INT0IF = 0;
        INTCON.INT0IE = 1;
        INTCON.GIE = 1;

        while(1)
        {
                PORTA=0X01;
                PORTD = array[t];
                DELAY_MS(50);
                PORTA=0X02;
                PORTD = array[u];
                DELAY_MS(50);

        }
}
