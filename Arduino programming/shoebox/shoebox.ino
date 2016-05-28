#include <SoftwareSerial.h>
//#include<DHT11.h>
#define DEBUG true
  
//int pin=7;
//DHT11 dht11(pin);
 
SoftwareSerial esp8266(2,3);


void setup() {
  Serial.begin(9600);
  esp8266.begin(9600); 
  
  pinMode(11, OUTPUT);
  digitalWrite(11, LOW);
  
  pinMode(12, OUTPUT);
  digitalWrite(12, LOW);
  
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
   
  sendData("AT+RST\r\n",2000,DEBUG); 
  sendData("AT+CIOBAUD?\r\n",2000,DEBUG); 
  sendData("AT+CWMODE=3\r\n",1000,DEBUG); 
  sendData("AT+CWLAP\r\n",3000,DEBUG); 

  sendData("AT+CWJAP=\"AndroidHotspot5051\",\"rbgur123!@#\"\r\n",5000,DEBUG); // join the access point
  sendData("AT+CIFSR\r\n",1000,DEBUG); // get ip address - 192.168.43.194
  sendData("AT+CIPMUX=1\r\n",1000,DEBUG); 
  sendData("AT+CIPSERVER=1,80\r\n",1000,DEBUG); // turn on server on port 80

 // Serial.println("Start");
}
 
void loop() {
  if(esp8266.available()) { // check if the esp is sending a message
    if(esp8266.find("+IPD,")) {
      delay(1000); // wait for the serial buffer to fill up (read all the serial data)
      // get the connection id so that we can then disconnect
      int connectionId = esp8266.read()-48; // subtract 48 because the read() function returns 
                                           // the ASCII decimal value and 0 (the first decimal number) starts at 48
      esp8266.find("pin="); // advance cursor to "pin="
      int pinNumber = (esp8266.read()-48)*10; // get first number i.e. if the pin 13 then the 1st number is 1, then multiply to get 10
      pinNumber += (esp8266.read()-48); // get second number, i.e. if the pin number is 13 then the 2nd number is 3, then add to the first number
      digitalWrite(pinNumber, !digitalRead(pinNumber)); // toggle pin    
     
      // make close command
      String closeCommand = "AT+CIPCLOSE="; 
      closeCommand+=connectionId; // append connection id
      closeCommand+="\r\n";
      sendData(closeCommand,1000,DEBUG); // close connection
       }
  }

  
/**  Serial.println();

  int err;
  float temp, humi;
  if((err=dht11.read(humi, temp))==0){
    
    Serial.print("temperature : ");
    Serial.print(temp);
    Serial.print("humidity : ");
    Serial.print(humi);
    Serial.println();
  }
  else {
    Serial.println();
    Serial.print("Error No : ");
    Serial.print(err);
    Serial.println();
  }
  delay(10000);*/
}
 
/*
* Name: sendData
* Description: Function used to send data to ESP8266.
* Params: command - the data/command to send; timeout - the time to wait for a response; debug - print to Serial window?(true = yes, false = no)
* Returns: The response from the esp8266 (if there is a reponse)
*/
String sendData(String command, const int timeout, boolean debug) {
    String response = "";
    esp8266.print(command); // send the read character to the esp8266
    long int time = millis();
    
    while( (time+timeout) > millis()) {
      while(esp8266.available()) {
        // The esp has data so display its output to the serial window 
        char c = esp8266.read(); // read the next character.
        response+=c;
      }
    }
    
    if(debug) {
      Serial.print(response);
    }
    return response;
}


