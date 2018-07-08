#include <Servo.h>
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24_config.h>
#include <printf.h>
#include <RF24.h>
#include <NMEAGPS.h>
#include <GPSfix.h>
#include <GPSport.h>
#include <Streamers.h>
#include "telemetry.h"

NMEAGPS gps;

byte uplinkAddress[6] = "ULINK";
byte downlinkAddress[6] = "DLINK";
RF24 radio(8, 10); // (CE, CS)

#define MOTORS_LEFT 5
Servo pitch;
Servo yaw;



void setup() {

	Serial.begin(9600);
	//Serial.begin(115200);
	//printf_begin();

	radio.begin();
	if (radio.isChipConnected())
	{
		//Serial.println("Chip connected.");
	}
	else
	{
		//Serial.println("Chip disconnected.");
	}

	radio.setPALevel(RF24_PA_MAX);
	radio.setRetries(15, 15);
	radio.setDataRate(RF24_2MBPS);

	radio.openReadingPipe(1, uplinkAddress);
	radio.openWritingPipe(downlinkAddress);

	//radio.printDetails();

	radio.startListening();

	pitch.attach(9);
	yaw.attach(6);
	pinMode(MOTORS_LEFT, OUTPUT);
}



void loop() {

	long lat = 0;
	long lon = 0;
	long alt = 0;

	while (gps.available(Serial))
	{
		gps_fix fix = gps.read();

		//trace_all(Serial, gps, fix);
		//print_status(&fix);

		if (fix.valid.location) {

			lat = fix.latitudeL();
			lon = fix.longitudeL();
			alt = fix.altitude_ft();
			//// The base location, in degrees * 10,000,000
			//NeoGPS::Location_t base(50.1272580, 14.4231460); // Ayers Rock, AU
			//												 //                       501298995L, 144326827L
			//float range = fix.location.DistanceKm(base);

			//DEBUG_PORT.print(F("Range: "));
			//DEBUG_PORT.print(range);
			//DEBUG_PORT.println(F(" Km"));
			//DEBUG_PORT.print(F("Altitude: "));
			//DEBUG_PORT.print(fix.alt.whole);
			//DEBUG_PORT.println(F(" m"));
		}


		//    Serial.println(fix.status);
		//    Serial.println(fix.latitude());
		//    Serial.println(fix.longitude());
		//    Serial.println(fix.heading());
		//    Serial.println(fix.geoidHeight());
		//Serial.println(fix.satellites);
	}

	if (radio.available())
	{
		telemetry_up_t telemetry;

		while (radio.available()) {
			radio.read(&telemetry, sizeof(telemetry));
		}

		setServoAngle(telemetry.pitch, &pitch);
		setServoAngle(telemetry.yaw, &yaw);

		analogWrite(MOTORS_LEFT, 180L * telemetry.motor / 800 / 2);

		//Serial.print("pitch: ");
		//Serial.print(telemetry.pitch);
		//Serial.print(" yaw: ");
		//Serial.print(telemetry.yaw);
		//Serial.print(" roll: ");
		//Serial.print(telemetry.roll);
		//Serial.print(" motor: ");
		//Serial.print(telemetry.motor);
		//Serial.print(" button: ");
		//Serial.print(telemetry.button);
		//Serial.println();
	}
}

void setServoAngle(int value, Servo *servo)
{
	value = value / 10 * 10;
	int angle = 180L * value / 800;
	servo->write(angle);
}