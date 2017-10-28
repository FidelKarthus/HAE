/* Using some counters*/

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

char x;
unsigned int aux;
float num;
char txt [14];

void interrupt() //se ha pulsado una tecla
{
        aux = (ADRESL >> 6);
        aux = aux + (ADRESH << 2);
        num = aux*0.00488758;
        FloatToStr (num, txt);
        lcd_cmd(_lcd_clear);
        Lcd_out(1,1, txt);
        delay_ms(1000);
        PIR1.ADIF=0;
        ADCON0.B2=1;

}

void main() {
        TRISA = 0x01;
        PORTA = 0x00;
        Lcd_Init();
        ADRESL = 0x00;
        ADRESH = 0x00;

        INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
        //x=PORTA;//para poder borrar el RBIF
        //INTCON.RBIF=0;
        ADCON1 = 0x0E;
        ADCON0 = 0x45;
        PIR1.ADIF=0;
        PIE1.ADIE=1;
        IPR1.ADIP=0;
        INTCON.PEIE = 1;
        INTCON.GIE=1;
        ADCON0.B2=1;
        while(1) ;
}
