

void setup() {
 
  Serial.begin(9600);
}


void loop() {
  
  int sensorValue = analogRead(A0);
  
 // Serial.println(sensorValue);
 if(sensorValue <200)Serial.println(0);
  else Serial.println(1);
 
  delay(1);        
}
