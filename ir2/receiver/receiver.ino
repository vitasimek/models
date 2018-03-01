
#define CONTROL 2
#define BUTTON_1 5
#define BUTTON_2 4
#define BUTTON_3 3
#define LED 13



void setup() {

  pinMode(LED, OUTPUT);
  pinMode(BUTTON_1, INPUT_PULLUP);
  pinMode(BUTTON_2, INPUT_PULLUP);
  pinMode(BUTTON_3, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(CONTROL), blink, CHANGE);
  
  Serial.begin(115200);  
}

void loop() {

  int value = digitalRead(CONTROL);
  int button_1 = digitalRead(BUTTON_1);
  int button_2 = digitalRead(BUTTON_2);
  int button_3 = digitalRead(BUTTON_3);

  Serial.print("\tA: ");
  Serial.print(button_1);
  Serial.print("\tB: ");
  Serial.print(button_2);
  Serial.print("\tC: ");
  Serial.print(button_3);
  Serial.print("\tValue: ");
  Serial.println(value);

  delay(125);
}

void blink()
{
  digitalWrite(LED, !digitalRead(LED));
}

