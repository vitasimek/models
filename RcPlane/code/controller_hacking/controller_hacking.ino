#include <printf.h>
#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
 
RF24 radio(7, 8); // (CE, CS)
//RF24 radio(2, 10); // (CE, CS)
 
void setup(void)
{ 
    Serial.begin(115200);
    printf_begin();
    radio.begin();
    if (radio.isChipConnected())
    {
      Serial.println("Chip connected.");
    }
    else
    {
        Serial.println("Chip disconnected.");
    }
    
    radio.printDetails();
} 

void loop(void)
{
}
/* 
int serial_putc( char c, FILE * ) 
{
  Serial.write( c );
  return c;
} 
*/
 /*
void printf_begin(void)
{
  fdevopen( &serial_putc, 0 );
}
*/
