#include <boarddefs.h>
#include <IRremote.h>
#include <OneWire.h>


#define CONTROL 2
#define BUTTON_1 5
#define BUTTON_2 4
#define BUTTON_3 3
#define LED 13
#define SPEAKER 6

IRrecv receiver(CONTROL, LED);


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


void setup()
{
  Serial.begin(115200);

  receiver.blink13(true);
  receiver.enableIRIn();
  
}

void loop()
{
  decode_results results;

  if (receiver.decode(&results))
  {
    decodePumpkin(&results);

    data_serializer_t serializer;
    serializer.raw_data = results.value;

    byte checksum = serializer.data.serial_no + serializer.data.value;
    bool isValid = (serializer.data.checksum == checksum);

    Serial.print("Type: 0x");
    Serial.print(results.decode_type, HEX);
    Serial.print("\t");
    Serial.print("Raw length: ");
    Serial.print(results.rawlen);
    Serial.print("\t");
    Serial.print("S/N: 0x");
    Serial.print(serializer.data.serial_no, HEX);
    Serial.print("\t");
    Serial.print("Value: 0x");
    Serial.print(serializer.data.value, HEX);
    Serial.print("\t");
    Serial.print("Checksum: 0x");
    Serial.print(serializer.data.checksum, HEX);
    Serial.print("\t");
    Serial.print("Valid: ");
    Serial.print(isValid ? "yes" : "no");
    Serial.println();
 
    receiver.resume();    
  }
  else
  {
//    Serial.println("X");
  }
}

bool decodePumpkin (decode_results *results)
{
  long  data   = 0;
  int   offset = 0;  // Dont skip first space, check its size

  if (irparams.rawlen < (2 * 32) + 2)
  {
    return false;
  }

  offset++;

  if (!MATCH_MARK(results->rawbuf[offset++], 2400))
  {
    return false;
  }

  while (offset + 1 < irparams.rawlen)
  {
    if (!MATCH_SPACE(results->rawbuf[offset++], 600))
    {
      break;
    }

    if(MATCH_MARK(results->rawbuf[offset], 1200))
    {
      data = (data << 1) | 1;
    }
    else if(MATCH_MARK(results->rawbuf[offset], 600))
    {
      data = (data << 1) | 0;
    }
    else
    {
      return false;
    }
    
    offset++;
  }

  results->bits = (offset - 1) / 2;
  if (results->bits < 32) {
    results->bits = 0;
    return false;
  }
  results->value       = data;
  results->decode_type = 0x49;
  return true;
}

