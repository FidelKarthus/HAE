#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica5b/pract5b.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

char x;
unsigned short num = 0;
short aux = 1;
char txt [4];

void interrupt()
{
if(aux)
{
 ByteToStr (num, txt);
 Lcd_out(1,1, txt);
 num++;
 if(num == 100)
 num = 0;
}
aux=!aux;
x=PORTB;
INTCON.RBIF=0;
}




void main() {
TRISB=0x10;
PORTB=0;
Lcd_Init();

INTCON2.RBPU=0;
x=PORTB;
INTCON.RBIF=0;
INTCON.RBIE=1;
INTCON.GIE=1;
while(1);
}
