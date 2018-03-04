
#define CONTROL 2
#define BUTTON_1 5
#define BUTTON_2 4
#define BUTTON_3 3
#define LED 13
#define SPEAKER 6


void setup() {

  pinMode(LED, OUTPUT);
  pinMode(BUTTON_1, INPUT_PULLUP);
  pinMode(BUTTON_2, INPUT_PULLUP);
  pinMode(BUTTON_3, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(CONTROL), blink, CHANGE);
  
  Serial.begin(115200);  
}

volatile int hit_count = 0;
volatile int last_hit_count = 0;

void loop() {

  int value = 0;// digitalRead(CONTROL);
  int button_1 = digitalRead(BUTTON_1);
  int button_2 = digitalRead(BUTTON_2);
  int button_3 = digitalRead(BUTTON_3);

  int hit_count_difference = 0;
  
  if (hit_count > last_hit_count)
  {
    hit_count_difference = hit_count - last_hit_count;

    int tone_fequency = hit_count_difference * 100;
    

    tone(SPEAKER, tone_fequency);
  }
  else
  {
    noTone(SPEAKER);
  }

  last_hit_count = hit_count;

//  Serial.print("\tA: ");
//  Serial.print(button_1);
//  Serial.print("\tB: ");
//  Serial.print(button_2);
//  Serial.print("\tC: ");
//  Serial.print(button_3);
//  Serial.print("\tValue: ");
//  Serial.print(value);
//  Serial.print("\thit_count: ");
//  Serial.println(hit_count_difference);

  delay(125);  
}

void blink()
{
  if (digitalRead(CONTROL) == HIGH)
  {
    hit_count++;
  }
}

