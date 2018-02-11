#include <NMEAGPS.h>
#include <GPSfix.h>
#include <GPSport.h>
#include <Streamers.h>

NMEAGPS gps;

void setup() {
  Serial.begin(115200);
  Serial1.begin(9600);
  Serial.println(gps.string_for( LAST_SENTENCE_IN_INTERVAL ));
}

void loop() {

  while(gps.available(Serial1))
  {
    gps_fix fix = gps.read();

    trace_all( Serial, gps, fix );
    print_status(&fix);

    if (fix.valid.location) {

      // The base location, in degrees * 10,000,000
      NeoGPS::Location_t base(50.2544856, 14.900500); // Ayers Rock, AU
      float range = fix.location.DistanceKm(base);

      DEBUG_PORT.print( F("Range: ") );
      DEBUG_PORT.print( range );
      DEBUG_PORT.println( F(" Km") );
      DEBUG_PORT.print( F("Altitude: ") );
      DEBUG_PORT.print( fix.alt.whole );
      DEBUG_PORT.println( F(" m") );
    }

    
//    Serial.println(fix.status);
//    Serial.println(fix.latitude());
//    Serial.println(fix.longitude());
//    Serial.println(fix.heading());
//    Serial.println(fix.geoidHeight());
    //Serial.println(fix.satellites);
  }
}

void print_status(gps_fix *fix)
{
  switch(fix->status)
  {
    case gps_fix::STATUS_NONE:
      Serial.println("STATUS_NONE");
      break;
    case gps_fix::STATUS_EST:
      Serial.println("STATUS_EST");
      break;
    case gps_fix::STATUS_TIME_ONLY:
      Serial.println("STATUS_TIME_ONLY");
      break;
    case gps_fix::STATUS_STD:
      Serial.println("STATUS_STD");
      break;
    case gps_fix::STATUS_DGPS:
      Serial.println("STATUS_DGPS");
      break;
//    case gps_fix::STATUS_RTK_FLOAT:
//      Serial.println("STATUS_RTK_FLOAT");
//      break;
//    case gps_fix::STATUS_RTK_FIXED:
//      Serial.println("STATUS_RTK_FIXED");
//      break;
//    case gps_fix::STATUS_PPS:
//      Serial.println("STATUS_PPS");
//      break;
    default:
      Serial.println("UNKNOWN STATUS");
      break;
  }
}

