#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica1/p1.c"

void main() {
 TRISC = 0X00;
 PORTC = 0X01;
 while(1)
 {
 DELAY_MS(200);
 PORTC = (PORTC << 1);
 DELAY_MS(100);
 if (PORTC == 0X00){
 PORTC = 0X01;
 }
}
}
