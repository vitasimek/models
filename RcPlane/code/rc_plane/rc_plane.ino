#include <Servo.h>

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24_config.h>
#include <printf.h>
#include <RF24.h>

#define MOTORS_LEFT 5

byte uplinkAddress[6] = "ULINK";
byte downlinkAddress[6] = "DLINK";


RF24 radio(8, 10); // (CE, CS)


Servo pitch;
Servo yaw;


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

    radio.setPALevel(RF24_PA_MAX);
    radio.openReadingPipe(1, uplinkAddress);
    radio.openWritingPipe(downlinkAddress);

    radio.printDetails();

    radio.startListening();

    pitch.attach(9);
    yaw.attach(6);
    pinMode(MOTORS_LEFT, OUTPUT);
}

int lastAngle = 0;

void loop() {

   if(radio.available())
   {
      int joystick;
      
      while (radio.available()) {
        radio.read( &joystick, sizeof(int));
      }

      joystick = joystick / 10 * 10;
      int angle = (long)180*joystick/800;

      if (lastAngle != angle)
      {
        lastAngle = angle;
        Serial.print(joystick);
        Serial.print(" -> ");
        Serial.println(angle);

        pitch.write(angle);
        yaw.write(angle);
        analogWrite(MOTORS_LEFT, angle / 2);
      }
  }
}
