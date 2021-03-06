#define F_CPU 4000000UL

#include <IRremote.h>
#include <boarddefs.h>
#include <IRremoteInt.h>
#include <avr/delay.h>
#include <avr/sleep.h>
#include <avr/power.h>
#include <avr/wdt.h>

#define adc_disable() (ADCSRA &= ~(1<<ADEN))
#define adc_enable() (ADCSRA |=  (1<<ADEN))

#define IR_LED 1

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
	//OSCCAL = 147;

	//adc_disable();
	//set_sleep_mode(SLEEP_MODE_PWR_DOWN);
}

volatile byte count = 0;

ISR(WDT_vect)
{
	count++;
	wdt_disable();
}


data_t data = { 0x14, 0x0000 };

void loop()
{
	// clear various "reset" flags
	MCUSR = 0;
	// allow changes, disable reset
	WDTCR = bit(WDCE) | bit(WDE);
	// set interrupt mode and an interval 
	WDTCR = bit(WDIE) | bit(WDP2) | bit(WDP1);    // set WDIE, and 8 seconds delay
	wdt_reset();  // pat the dog

	set_sleep_mode(SLEEP_MODE_PWR_DOWN);
	noInterrupts();
	sleep_enable();
	interrupts();
	power_all_disable();
	sleep_cpu();
	power_all_enable();



	data.value++;
	data.checksum = data.serial_no + data.value;

	data_serializer_t serializer;
	serializer.data = data;

	sendPumpkin(serializer.raw_data, 32);

	//_delay_ms(125);

	//adc_disable();
	//power_adc_disable();
	
	//sleep_enable();
	//sleep_cpu();
	
	//adc_enable();
}

void sendPumpkin(unsigned long data, int nbits)
{
	sender.enableIROut(38);

	TIMER_ENABLE_PWM;
	_delay_us(2400);
	TIMER_DISABLE_PWM;
	_delay_us(600);

	//mark(2400);
	//space(600);

	for (unsigned long mask = 0x00000001UL << (nbits - 1); mask; mask >>= 1)
	{
		if (data & mask)
		{
			TIMER_ENABLE_PWM;
			_delay_us(1200);
			TIMER_DISABLE_PWM;
			_delay_us(600);
			//mark(1200);
			//space(600);
		}
		else
		{
			TIMER_ENABLE_PWM;
			_delay_us(600);
			TIMER_DISABLE_PWM;
			_delay_us(600);
			//mark(600);
			//space(600);
		}
	}
}

//void  sendRaw(const unsigned int buf[], unsigned int len, unsigned int hz)
//{
//	// Set IR carrier frequency
//	sender.enableIROut(hz);
//
//	for (unsigned int i = 0; i < len; i++) {
//		if (i & 1)  space(buf[i]);
//		else        mark(buf[i]);
//	}
//
//	space(0);  // Always end with the LED off
//}

////+=============================================================================
//// Sends an IR mark for the specified number of microseconds.
//// The mark output is modulated at the PWM frequency.
////
//void  mark(unsigned int time)
//{
//	TIMER_ENABLE_PWM; // Enable pin 3 PWM output
//	if (time > 0) _delay_us(time);
//}
//
////+=============================================================================
//// Leave pin off for time (given in microseconds)
//// Sends an IR space for the specified number of microseconds.
//// A space is no output, so the PWM output is disabled.
////
//void  space(unsigned int time)
//{
//	TIMER_DISABLE_PWM; // Disable pin 3 PWM output
//	if (time > 0) _delay_us(time);
//}
