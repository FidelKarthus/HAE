#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/proyecto/proyecto.c"

sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC4_bit;

sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D7_Direction at TRISC7_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC4_bit;

short x;
unsigned short num = 0;
char txt [4];
void interrupt()
{
 num = num*16570;
 ByteToStr (num, txt);
 Lcd_out(1,1, txt);

x=PORTB;
INTCON.RBIF=0;
}

void main() {
 Lcd_Init();
 TRISB = 0x10;
 PORTB = 0;
 PORTB = 0x01;
 DELAY_MS(5);
 PORTB = 0x00;

 INTCON2.RBPU=0;
 x=PORTB;
 INTCON.RBIF=0;
 INTCON.RBIE=1;
 INTCON.GIE=1;

 while(1){

 }
}
