/* Counters and timers TMR0h TMR0L*/

// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void funcion();

char x;
unsigned int aux;
float num;
char txt [14];
short count=1;
void interrupt() //se ha pulsado una tecla
{
        if(INTCON.INT0IF)   {
                if (count == 3) {
                        count = 1;
                } else {
                        count++;
                }
                funcion();
                INTCON.INT0IF=0;
        }

        if(INTCON.TMR0IF)
        {
                TMR0H = (3336 >>8);
                TMR0L = 3336;
                INTCON.TMR0IF = 0;
                ADCON0.B2=1;
        }
        if(PIR1.ADIF)   {
                funcion();
                PIR1.ADIF=0;

        }
}

void funcion()
{
        aux = (ADRESL >> 6);
        aux = aux + (ADRESH << 2);
        if (count==1) {
                num = aux*4.8875e-1;
        }
        if (count==2) {
                num = aux*4.8875e-1+273.15;
        }
        if (count==3) {
                num = aux*4.8875e-1*1.8+32.0;
        }
        FloatToStr (num, txt);
        lcd_cmd(_lcd_clear);
        Lcd_out(1,1, txt);

        if (count==1) {
                Lcd_Chr_CP('C');
        }
        if (count==2) {
                Lcd_Chr_CP('K');
        }
        if (count==3) {
                Lcd_Chr_CP('F');
        }
}

void main() {
        TRISE = 0x01;
        PORTE = 0x00;
        Lcd_Init();
        ADRESL = 0x00;
        ADRESH = 0x00;

        TRISB.B0 = 1; //se configura RB0 como entrada
        INTCON.PEIE = 0; //es de tipo core
        RCON.IPEN = 0; //se deshabilitan las interrupciones con prioridad (MikroC)
        INTCON2.INTEDG0 = x; //la interrupci�n la provoca un flanco de subida (x=1)/ bajada (x=0)
        INTCON.INT0IF = 0; // se pone el flag de la interrupci�n INT0 a 0
        INTCON.INT0IE = 1; // se habilita la interrupci�n INT0
        INTCON.GIE = 1; // se habilitan las interrupciones en general

        INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
        ADCON1 = 0x00;
        ADCON0 = 0x75;
        PIR1.ADIF=0;
        PIE1.ADIE=1;
        INTCON.PEIE = 1;
        INTCON.GIE=1;

        INTCON.TMR0IF = 0; // se pone el flag a 0
        INTCON.TMR0IE = 1; // se habilita la interrupci�n del Timer 0
        T0CON = 0x85;
        TMR0H = (3336 >>8);
        TMR0L = 3336;

        while(1) ;
}
