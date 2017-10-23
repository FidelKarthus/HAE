/* This code shows how to use a swich */
void main() {
        short aux=0;
        RBPU_BIT=0;
        INTCON2.RBPU=0;
        TRISB.B1=0;


        while(1)
        {
                if((PORTB.B0==0)&&(aux == 0))
                {
                        aux = 1;
                }else if(PORTB.B0==1 && aux==1)
                {
                        PORTB.B1=!PORTB.B1;
                        aux=0;
                }
                DELAY_MS(100);
        }
}
