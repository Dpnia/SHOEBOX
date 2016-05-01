int REDpin = 13;
int GREENpin = 5;

void setup() {
  pinMode(REDpin, OUTPUT);
  pinMode(GREENpin, OUTPUT);
}

void loop() {
  digitalWrite(REDpin, HIGH);
  delay(2000);
  digitalWrite(REDpin, LOW);
  delay(2000);
  digitalWrite(GREENpin, HIGH);
  delay(4000);
  digitalWrite(GREENpin, LOW);  
  }
