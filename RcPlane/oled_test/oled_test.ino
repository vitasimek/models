#include <U8g2lib.h>
#include <U8x8lib.h>


U8G2_SSD1306_128X64_NONAME_F_HW_I2C display(U8G2_R0);
//U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C

void setup()
{
  display.begin();
}

void loop()
{
  display.clearBuffer();
  display.setFont(u8g2_font_ncenB14_tr);
  display.drawStr(0, 20, "Hello World!");
  display.sendBuffer();
}
