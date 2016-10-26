#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica3b/MyProject.c"
void interrupt()
{
 PORTB.B1 = ! PORTB.B1;
 INTCON.INT0IF=0;

}

void main() {

 INTCON2.RBPU=0;
 TRISB.B0=1;
 TRISB.B1=0;
 PORTB.B1=1;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;
 while(1)
 {
 asm nop;
 }
}
