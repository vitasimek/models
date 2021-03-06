#include <IRremote.h>


#define IR_LED 3
#define BUTTON A0


typedef struct
{
  byte serial_no;
  unsigned int value;
  byte checksum;
} data_t;

typedef union
{
  data_t data;
  unsigned long raw_data;
} data_serializer_t;


IRsend sender;

void setup()
{
  pinMode(13, OUTPUT);

  Serial.begin(115200);
}

data_t data = { 0xEE, 0x0000 };

void loop()
{
  data.value++;
  data.checksum = data.serial_no + data.value;

  data_serializer_t serializer;
  serializer.data = data;

  sendPumpkin(serializer.raw_data, 32);
  Serial.println(serializer.raw_data, HEX);

  delay(1000);
}

void sendPumpkin (unsigned long data, int nbits)
{
  sender.enableIROut(38);

  sender.mark(2400);
  sender.space(600);

  for (unsigned long  mask = 0x00000001UL << (nbits - 1);  mask;  mask >>= 1)
  {
    if (data & mask)
    {
      sender.mark(1200);
      sender.space(600);
    }
    else
    {
      sender.mark(600);
      sender.space(600);
    }
  }
}

