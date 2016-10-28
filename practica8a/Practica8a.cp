#line 1 "C:/Documents and Settings/Electr�nica/Escritorio/Pr�cticas HAE 15-16/Lunes de 12-30 a 14-30/practica8a/Practica8a.c"

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

void funcion();

char x;
unsigned int aux;
float num ;
char txt [14];
short count=1;
void interrupt()
{
 if(INTCON3.INT2IF) {
 if (count == 8){
 count = 1;
 } else {
 count++;
 }
 funcion();
 INTCON3.INT2IF = 0;
 }

 if(INTCON.TMR0IF)
 {
 TMR0H = (3036 >>8);
 TMR0L = 3036;
 INTCON.TMR0IF = 0;
 ADCON0.B2=1;
 }
 if(PIR1.ADIF) {
 funcion();
 PIR1.ADIF=0;

 }
}

void funcion()
{
 aux = (ADRESL >> 6);
 aux = aux + (ADRESH << 2);
 num = (aux*0.1085025+10.5);

 if (count==2){
 num = num/6.8927;
 }
 if (count==3){
 num = num/101.325;
 }
 if (count==4){
 num = num/0.1;
 }
 if (count==5){
 num = num/0.13328;
 }
 if (count==6){
 num = num/0.001;
 }
 if (count==7){
 num = num/98.039;
 }
 if (count==8){
 num = num/9.81;
 }

 FloatToStr (num, txt);
 lcd_cmd(_lcd_clear);
 Lcd_out(1,1, txt);

 if (count==1){
 Lcd_Out_CP("Kpa");
 }
 if (count==2){
 Lcd_Out_CP("Psi");
 }
 if (count==3){
 Lcd_Out_CP("Atm");
 }
 if (count==4){
 Lcd_Out_CP("mBar");
 }
 if (count==5){
 Lcd_Out_CP("mmHg");
 }
 if (count==6){
 Lcd_Out_CP("N/m2");
 }
 if (count==7){
 Lcd_Out_CP("Kg/cm2");
 }
 if (count==8){
 Lcd_Out_CP("kp/cm^2");
 }
}

void main() {
 TRISE = 0x01;
 PORTE = 0x00;
 Lcd_Init();
 ADRESL = 0x00;
 ADRESH = 0x00;

 TRISB.B2 = 1;
 INTCON.PEIE = 0;
 RCON.IPEN = 0;
 INTCON2.INTEDG2 = x;
 INTCON3.INT2IF = 0;
 INTCON3.INT2IE = 1;
 INTCON.GIE = 1;

 INTCON2.RBPU=0;
 ADCON1 = 0x09;
 ADCON0 = 0xAD;
 PIR1.ADIF=0;
 PIE1.ADIE=1;
 INTCON.PEIE = 1;
 INTCON.GIE=1;

 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;
 T0CON = 0x84;
 TMR0H = (3036 >>8);
 TMR0L = 3036;

 while(1);
}
