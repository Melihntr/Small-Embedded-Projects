#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2); // LCD I2C address might vary

unsigned long previousMillis = 0;
const long interval = 60000; // 1 minute in milliseconds

int hours = 0;
int minutes = 0;

void setup() {
  lcd.begin();
  lcd.backlight();
  
  // Set initial time (for example, 12:00)
  hours = 12;
  minutes = 0;

  lcd.setCursor(0, 0);
  lcd.print("Digital Clock");
  delay(2000);
  lcd.clear();
}

void loop() {
  unsigned long currentMillis = millis();

  // Check if one minute has passed
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
    incrementTime();
  }
  
  displayTime();
  delay(1000); // Refresh display every second
}

void incrementTime() {
  minutes++;
  if (minutes >= 60) {
    minutes = 0;
    hours++;
    if (hours >= 24) {
      hours = 0;
    }
  }
}

void displayTime() {
  lcd.setCursor(0, 0);
  lcd.print("Time: ");
  
  if (hours < 10) lcd.print("0");
  lcd.print(hours);
  lcd.print(":");
  
  if (minutes < 10) lcd.print("0");
  lcd.print(minutes);
}
