// Lcd pinout settings
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC4_bit;
// Pin direction
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D7_Direction at TRISC7_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC4_bit;

short x;
unsigned short num = 0;
char txt [4];
void interrupt() //se ha pulsado una tecla
{



     /*
  num = num*16570;
  ByteToStr (num, txt);
  Lcd_out(1,1, txt);
     */
x=PORTB; //hay que leer el puerto B para poder borrar el bit RBIF (define x global)
INTCON.RBIF=0;//Al borrar el bit RBIF despues de llamar a la funcion tecla, nos
}

void main() {
  Lcd_Init();
  TRISB = 0x10;
  PORTB = 0;
  PORTB = 0x01;
  DELAY_MS(5);
  PORTB = 0x00;

  INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
  x=PORTB;//para poder borrar el RBIF
  INTCON.RBIF=0;
  INTCON.RBIE=1;
  INTCON.GIE=1;
  
  while(1){

  }
}