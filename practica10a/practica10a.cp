#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica10a/practica10a.c"
int aux;
int paquete;
int paqH; paqL;
short freq=1;

void interrupt()
{
 if(INTCON.INT0IF)
 {


 freq++;

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

 TRISB.B1 = 1;
 INTCON.PEIE = 0;
 RCON.IPEN = 0;
 INTCON2.INTEDG1 = 1;
 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 1;
 INTCON.GIE = 1;


 while(1){

 for (paquete=0;paquete<=4095;paquete+=freq){

 PORTC.B0 = 0;
 aux = 0x30 | ((paquete >> 8) & 0x0F);
 SPI1_Write(aux);
 SPI1_Write(paquete);
 PORTC.B0 = 1;
 delay_us(10);

 }
 for (paquete=4095;paquete>=0;paquete-=freq){

 PORTC.B0 = 0;
 aux = 0x30 | ((paquete >> 8) & 0x0F);
 SPI1_Write(aux);
 SPI1_Write(paquete);
 PORTC.B0 = 1;
 delay_us(10);

 }
 }

}
