int REDpin = 13;
//int GREENpin = 5;

void setup() {
  pinMode(REDpin, OUTPUT);
  //pinMode(GREENpin, OUTPUT);
}

void loop() {
  digitalWrite(REDpin, HIGH);
  delay(5000); // 5초간!
  digitalWrite(REDpin,LOW);
  delay(5000);
  //digitalWrite(GREENpin,HIGH);
  //delay(5000);
  //digitalWrite(GREENpin,LOW);
  }
