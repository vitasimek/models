#include <U8x8lib.h>
#include <U8g2lib.h>

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24_config.h>
#include <printf.h>
#include <RF24.h>


byte uplinkAddress[6] = "ULINK";
byte downlinkAddress[6] = "DLINK";


RF24 radio(9, 10); // (CE, CS)

U8G2_SSD1306_128X64_NONAME_F_HW_I2C display(U8G2_R0);

void setup() {

    display.begin();
    
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

    radio.setPALevel(RF24_PA_MAX);
    radio.setRetries(15,15);
//    radio.openReadingPipe(1, downlinkAddress);
    radio.openWritingPipe(uplinkAddress);
    //radio.startListening();
    radio.stopListening();
    radio.printDetails();
/*
    pinMode(A2, OUTPUT);
    digitalWrite(A2, HIGH);
    
    pinMode(A4, OUTPUT);    
    digitalWrite(A4, LOW);
    */
}



void loop() {

    int joystick = analogRead(A3) / 10 * 10;

    Serial.println(joystick);

//      radio.stopListening(); 

    if (!radio.write(&joystick, sizeof(int)))
    {
      Serial.println(F("failed"));
    }

//      radio.startListening();

  display.clearBuffer();

  display.setFont(u8g2_font_inb38_mn);
  display.setCursor(20, 60);
  display.print(joystick);  
  
  display.sendBuffer();



  //tone(5, joystick*2);
  //delay(50);
  
  //delay(125);
}
