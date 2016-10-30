int aux;
int paquete;
int paqH; paqL;
short freq=1;

void interrupt()
{
        if(INTCON.INT0IF)
        {
                //if(freq != 10)
                //{
                freq++;
                //}
                INTCON.INT0IF=0;
        }
        if(INTCON3.INT1IF)
        {
                if(freq > 1)
                {
                        freq--;
                }
                INTCON3.INT1IF = 0;
        }

}

void main() {
        TRISB = 0xFF;
        TRISC = 0x00;
        PORTC = 0x00;
        SPI1_Init();
        delay_ms(100);

        INTCON2.RBPU=0;
        INTCON.INT0IF = 0;
        INTCON2.INTEDG0=1;
        INTCON.INT0IE = 1;
        INTCON.GIE = 1;

        TRISB.B1 = 1; // se configura RB1 como entrada
        INTCON.PEIE = 0; // es de tipo core
        RCON.IPEN = 0; // se deshabilitan las interrupciones con prioridad (MikroC)
        INTCON2.INTEDG1 = 1; //la interrupci�n la provoca un flanco de subida (x=1)/ bajada (x=0)
        INTCON3.INT1IF = 0; // se pone el flag de la interrupci�n INT1 a 0
        INTCON3.INT1IE = 1; // se habilita la interrupci�n INT1
        INTCON.GIE = 1; // se habilitan las interrupciones en general


        while(1) {

                for (paquete=0; paquete<=4095; paquete+=freq) {

                        PORTC.B0 = 0;
                        aux = 0x30 | ((paquete >> 8) & 0x0F);
                        SPI1_Write(aux);
                        SPI1_Write(paquete);
                        PORTC.B0 = 1;
                        delay_us(10);

                }
                for (paquete=4095; paquete>=0; paquete-=freq) {

                        PORTC.B0 = 0;
                        aux = 0x30 | ((paquete >> 8) & 0x0F);
                        SPI1_Write(aux);
                        SPI1_Write(paquete);
                        PORTC.B0 = 1;
                        delay_us(10);

                }
        }

}