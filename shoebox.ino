#include <SoftwareSerial.h>
#define DEBUG true
 
SoftwareSerial esp8266(0,1); // make RX Arduino line is pin 2, make TX Arduino line is pin 3.
                                        // This means that you need to connect the TX line from the esp to the Arduino's pin 2
                                        // and the RX line from the esp to the Arduino's pin 3


void setup() {
  Serial.begin(9600);
  esp8266.begin(9600); // your esp's baud rate might be different
  
  pinMode(11, OUTPUT);
  digitalWrite(11, LOW);
  
  pinMode(12, OUTPUT);
  digitalWrite(12, LOW);
  
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
   
  sendData("AT+RST\r\n",2000,DEBUG); // reset module
  sendData("AT+CIOBAUD?\r\n",2000,DEBUG); // check baudrate (redundant)
  sendData("AT+CWMODE=3\r\n",1000,DEBUG); // configure as access point (working mode: AP+STA)
  sendData("AT+CWLAP\r\n",3000,DEBUG); // list available access points

  sendData("AT+CWJAP=\"yourIP\",\"yourPasswd\"\r\n",5000,DEBUG); // join the access point
  sendData("AT+CIFSR\r\n",1000,DEBUG); // get ip address
  sendData("AT+CIPMUX=1\r\n",1000,DEBUG); // configure for multiple connections
  sendData("AT+CIPSERVER=1,80\r\n",1000,DEBUG); // turn on server on port 80
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

<html>
 <head>
  <title>ESP8266 LED Control</title>
 </head>
 <body>
 
 <!-- in the <button> tags below the ID attribute is the value sent to the arduino -->
 
 <button id="11" class="led">Toggle Pin 11</button> <!-- button for pin 11 -->
 <button id="12" class="led">Toggle Pin 12</button> <!-- button for pin 12 -->
 <button id="13" class="led">Toggle Pin 13</button> <!-- button for pin 13 -->
  
 <script src="jquery.min.js"></script>
 <script type="text/javascript">
  $(document).ready(function(){
   $(".led").click(function(){
    var p = $(this).attr('id'); // get id value (i.e. pin13, pin12, or pin11)
    // send HTTP GET request to the IP address with the parameter "pin" and value "p", then execute the function
    $.get("http://192.168.43.194:80/", {pin:p}); // execute get request (아두이노 웹서버 IP 주소로 고쳐 준다)
   });
  });
 </script>
 </body>
</html>




