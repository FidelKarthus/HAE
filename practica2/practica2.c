
void main() {

        char array[]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
        short u = 0;
        short d = 0;
        short t = 0;
        TRISC = 0X00;
        TRISD = 0X00;
        PORTC = 0X00;
        PORTD = 0X03;//apagados

        while(1)
        {
                for (u=0; u <= 9; u++ )
                {
                        for (t=0; t < 25; t++ )
                        {
                                PORTD = 0X02;
                                PORTC = array[d];
                                DELAY_MS(20);
                                PORTD = 0X01;
                                PORTC = array[u];
                                DELAY_MS(20);
                        }
                }
                d+=1;
                if(d==6) {
                        d=0;
                }


        }
}