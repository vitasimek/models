#include <IRremote.h>
#include <IRremoteInt.h>
#include <boarddefs.h>
//#include <ir_Lego_PF_BitStreamEncoder.h>

#define IR_LED 3
#define BUTTON A0

IRsend sender;

void setup() {

  //pinMode(IR_LED, OUTPUT);
  pinMode(13, OUTPUT);
  //digitalWrite(IR_LED, LOW);

  pinMode(BUTTON, INPUT);
  digitalWrite(BUTTON,HIGH);
  
  //attachInterrupt(digitalPinToInterrupt(BUTTON), on_button_change, CHANGE);
  pciSetup(BUTTON);

  Serial.begin(115200);
}

volatile int pressed;

void loop() {

  int frequencyKHz = 38;
  unsigned int irSignal[] = {9000, 4500, 560,9000, 4500, 560,9000, 4500, 560,9000, 4500, 560, 560 };
  
  sender.sendRaw(irSignal, sizeof(irSignal) / sizeof(irSignal[0]), frequencyKHz);

//  int array[20];
//  
//  for(int i = 0; i < 20; i++)
//  {
//    array[i] = i % 2;
//  }
//
//  if (pressed)
//  {
//    digitalWrite(13, HIGH);
//    for (int i = 0; i < 7; i++)
//    {
//      digitalWrite(IR_LED, array[i]);
//      digitalWrite(IR_LED, array[i]);
//      delayMicroseconds(5*2);
//    }
//  }
//
//
//  digitalWrite(IR_LED, LOW);
//  digitalWrite(13, LOW);

  delay(125);
}


void pciSetup(byte pin)
{
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin));  // enable pin
    PCIFR  |= bit (digitalPinToPCICRbit(pin)); // clear any outstanding interrupt
    PCICR  |= bit (digitalPinToPCICRbit(pin)); // enable interrupt for the group
}

ISR (PCINT1_vect) // handle pin change interrupt for A0 to A5 here
{
  pressed = !digitalRead(BUTTON);  

//  digitalWrite(IR_LED, pressed);
//  digitalWrite(13, pressed);
}  
