#include <Servo.h>

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24_config.h>
#include <printf.h>
#include <RF24.h>


byte uplinkAddress[6] = "ULINK";
byte downlinkAddress[6] = "DLINK";


RF24 radio(7, 8); // (CE, CS)


Servo myservo;

void setup() {

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

    radio.setPALevel(RF24_PA_LOW);
    radio.openReadingPipe(1, uplinkAddress);
    radio.openWritingPipe(downlinkAddress);

    radio.printDetails();

    radio.startListening();

    myservo.attach(12);    
}

int lastAngle = 0;

void loop() {

   if(radio.available())
   {
      int joystick;
      
      while (radio.available()) {
        radio.read( &joystick, sizeof(int));
      }

      int angle = 180*joystick/800;

      if (lastAngle != angle)
      {
        lastAngle = angle;
        myservo.write(angle);
        Serial.print(joystick);
        Serial.print(" -> ");
        Serial.println(angle);
      }
  }
}
