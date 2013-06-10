#include <Servo.h>

//initialize all servos.
Servo servo;


void setup() {

  servo.attach(3);
  servo.write(100);
  Serial.begin(19200);
  Serial.println("Ready");

}

void loop() {


  if ( Serial.available()) {
    int ch = Serial.read();

    switch(ch) {
    case 1:
      servo.write(180);
      break;
    case 2:
      servo.write(135);
      break;
    case 3:
      servo.write(90); 
      break;
    case 4:
      servo.write(45);
      break;
    case 5:
      servo.write(0);
      break;
    }
  }

} 
