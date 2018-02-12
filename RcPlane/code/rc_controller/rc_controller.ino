#include <U8x8lib.h>
#include <U8g2lib.h>
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24_config.h>
#include <printf.h>
#include <RF24.h>
#include "telemetry.h"

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
	radio.setRetries(15, 15);
	radio.setDataRate(RF24_2MBPS);

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

	telemetry_up_t telemetry;

	telemetry.pitch = analogRead(A6);
	telemetry.yaw = analogRead(A7);
	telemetry.motor = analogRead(A3);
	int buttonValueLeft = analogRead(A0);
	int buttonValueRight = analogRead(A1);
	int roll = analogRead(A2);
	
	telemetry.button = getPressedButton(buttonValueLeft, buttonValueRight);

	Serial.print("pitch: ");
	Serial.print(telemetry.pitch);
	Serial.print(" yaw: ");
	Serial.print(telemetry.yaw);
	Serial.print(" roll: ");
	Serial.print(roll);
	Serial.print(" motor: ");
	Serial.print(telemetry.motor);
	Serial.print(" button: ");
	Serial.print(telemetry.button);
	Serial.print(" buttons left: ");
	Serial.print(buttonValueLeft);
	Serial.print(" buttons right: ");
	Serial.print(buttonValueRight);
	Serial.println();




	//      radio.stopListening(); 

	if (!radio.write(&telemetry, sizeof(telemetry)))
	{
		Serial.println(F("failed"));
	}

	//      radio.startListening();

	display.clearBuffer();

	display.setFont(u8g2_font_inb38_mn);
	display.setCursor(20, 60);
	display.print(telemetry.motor);

	display.sendBuffer();



	//tone(5, joystick*2);
	//delay(50);

	//delay(125);
}

int delta = 10;
buttonSpec leftButtons[] = {

	{ 750, 760, SW_01 },
	{ 620, 630, SW_02 },
	{ 490, 500, SW_03 },
	{ 370, 380, SW_04 },
	{ 240, 250, SW_05 },
};

buttonSpec rightButtons[] = {

	{ 750, 760, SW_06 },
	{ 620, 630, SW_07 },
	{ 490, 500, SW_08 },
	{ 370, 380, SW_09 },
	{ 240, 250, SW_10 },
};


button_e getPressedButton(int buttonValue, buttonSpec *buttonSpecs)
{
	for (int i = 0; i < 5; i++)
	{
		buttonSpec buttonSpec = buttonSpecs[i];
		int min = buttonSpec.min - delta;
		int max = buttonSpec.max + delta;

		if (buttonValue >= min && buttonValue <= max)
		{
			return buttonSpec.code;
		}
	}

	return SW_NONE;
}

button_e getPressedButton(int buttonValueLeft, int buttonValueRight)
{
	button_e button = SW_NONE;

	button = getPressedButton(buttonValueLeft, leftButtons);
	if (button == SW_NONE)
	{
		button = getPressedButton(buttonValueRight, rightButtons);
	}

	return button;
}