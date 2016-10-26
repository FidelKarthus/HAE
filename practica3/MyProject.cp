#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica3/MyProject.c"
void main() {
 short aux=0;
 RBPU_BIT=0;
 INTCON2.RBPU=0;
 TRISB.B1=0;


 while(1)
 {
 if((PORTB.B0==0)&&(aux == 0))
 {
 aux = 1;
 }else if(PORTB.B0==1 && aux==1)
 {
 PORTB.B1=!PORTB.B1;
 aux=0;
 }
 DELAY_MS(100);
 }
}
