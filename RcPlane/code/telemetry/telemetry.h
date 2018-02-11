// telemetry.h

#ifndef _TELEMETRY_h
#define _TELEMETRY_h

#if defined(ARDUINO) && ARDUINO >= 100
#include "arduino.h"
#else
#include "WProgram.h"
#endif


typedef enum
{
	SW_NONE,
	SW_01,
	SW_02,
	SW_03,
	SW_04,
	SW_05,
	SW_06,
	SW_07,
	SW_08,
	SW_09,
	SW_10,
	SW_11,
	SW_12,
	SW_13,
	SW_14,
	SW_15,

} button_e;

typedef struct {

	int min;
	int max;
	button_e code;

} buttonSpec;

typedef struct {

	int pitch;
	int yaw;
	int roll;
	int motor;
	button_e button;

} telemetry_t;

#endif

