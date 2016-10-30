
void main() {
        TRISC = 0X00;
        PORTC = 0X01;
        while(1)
        {
                DELAY_MS(200);
                PORTC = (PORTC << 1);
                DELAY_MS(100);
                if (PORTC == 0X00) {
                        PORTC = 0X01;
                }
        }
}