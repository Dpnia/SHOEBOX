#include <SoftwareSerial.h>
#include <stdlib.h>
#include "DHT.h"

#define DEBUG true 
#define DHTPIN 4 // 4번핀을 통해 온습도 전달!
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

SoftwareSerial esp8266(2,3); // wifi 2,3 핀 사용!
int FSR_value;
int sensorPin = A2;
int using_time=10; 
int using_shoe=0;

String apiKey = "5GYVWZQH0VFZRAT6";
int exit_flag = 0;  
char SoftSerial_read;
int ms_old, ms_new;

void setup() {
  Serial.begin(9600);
  esp8266.begin(9600); 

  pinMode(10,OUTPUT);
  digitalWrite(10,LOW);
  
  pinMode(11, OUTPUT);
  digitalWrite(11, LOW);
  
  pinMode(12, OUTPUT);
  digitalWrite(12, LOW);
  
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
   
  sendData("AT+RST\r\n",2000,DEBUG); 
  sendData("AT+CIOBAUD?\r\n",2000,DEBUG); 
  sendData("AT+CWMODE=3\r\n",1000,DEBUG); 
 // sendData("AT+CWLAP\r\n",3000,DEBUG);
   
  sendData("AT+CWJAP=\"AndroidHotspot5051\",\"rbgur123!@#\"\r\n",3000,DEBUG); // join the access point
  sendData("AT+CIFSR\r\n",1000,DEBUG); // get ip address - 192.168.43.194
  
  sendData("AT+CIPMUX=1\r\n",1000,DEBUG); 
  
     
  

  dht.begin();
 int counter = 0;
  esp8266.println("AT+RST");

  exit_flag = 0;
  ms_old = millis();
  do {
    ms_new = millis();
    if (esp8266.available())
    {
      SoftSerial_read = esp8266.read();
      Serial.write(SoftSerial_read);
    }
    if ( (ms_new - ms_old) > 3000 )
    {
      exit_flag = 1;
      Serial.println("\n\rtimeout@reset");
      Serial.println("====================================");
    }
  } while (exit_flag == 0);
  exit_flag = 0;

}
 
void loop() {
  
 float humi = dht.readHumidity(); // 습도값 읽기

 float temp = dht.readTemperature(); // 온도값 읽기

  Serial.print("Humidity : ");
  Serial.print(humi);
  Serial.println();
  Serial.print("Temperature : ");
  Serial.print(temp);
  Serial.println();

 FSR_value = analogRead(sensorPin);
 Serial.print("Sensor : ");
 Serial.println(FSR_value);
 
 if(FSR_value > 0){
 digitalWrite(10, HIGH);
 using_shoe = 20;
 }
 else{
  digitalWrite(10,LOW);
  using_time = using_time + 1;
  using_shoe = 10;
 }
 Serial.println(using_time);

 Serial.println(using_shoe);

 
  char buf[16];
  String strTemp = dtostrf(temp, 4, 1, buf);
  String strTemp2 = dtostrf(using_time, 4, 1, buf);
  String strTemp3 = dtostrf(humi, 4, 1, buf);
  String strTemp4 = dtostrf(using_shoe, 4, 1, buf);

    String cmd = "AT+CIPSTART=\"TCP\",\"";
  cmd += "184.106.153.149"; // api.thingspeak.com
  cmd += "\",80";
  esp8266.println(cmd);

  exit_flag = 0;
  ms_old = millis();
  do {
    ms_new = millis();
    if (esp8266.available())
    {
      SoftSerial_read = esp8266.read();
      Serial.write(SoftSerial_read);
      if (SoftSerial_read == 'd')
      {
        exit_flag = 1;
      }
    }
    if ((ms_new - ms_old) > 1000)
    {
      exit_flag = 1;
      Serial.println("\n\rtimeout@AT+CIPSTART");
    }
  } while (exit_flag == 0);
  exit_flag = 0;

  // prepare GET string
  String getStr = "GET /update?api_key=";
  getStr += apiKey;
  getStr += "&field1=";
  getStr += String(strTemp);
  getStr += "&field2=";
  getStr += String(strTemp2);
  getStr += "&field3=";
  getStr += String(strTemp3);
  getStr += "&field4=";
  getStr += String(strTemp4);
  getStr += "\r\n\r\n";

  // send data length
  cmd = "AT+CIPSEND=";
  cmd += String(getStr.length());
  esp8266.println(cmd);
  //Serial.println(cmd);

  exit_flag = 0;
  ms_old = millis();
  do {
    ms_new = millis();
    if (esp8266.available())
    {
      SoftSerial_read = esp8266.read();
      Serial.write(SoftSerial_read);
      if (SoftSerial_read == '>' )
      {
        exit_flag = 1;
        esp8266.print(getStr);
      }
    }
    if ((ms_new - ms_old) > 1000)
    {
      exit_flag = 1;
      Serial.println("\n\rtimeout@AT+CIPSEND");
    }
  } while (exit_flag == 0);
  exit_flag = 0;

  ms_old = millis();
  do {
    ms_new = millis();
    if (esp8266.available())
    {
      SoftSerial_read = esp8266.read();
      Serial.write(SoftSerial_read);
    }
    if ((ms_new - ms_old) > 3000)
    {
      exit_flag = 2;
      Serial.println("\n\rtimeout@final_send");
    }
  } while (exit_flag == 0);
  exit_flag = 0;

  // thingspeak needs 15 sec delay between updates
  //Serial.println("\n\rwait for 15 second");
  //Serial.println("------------------------------------");

  int counter=0;
  ms_old = millis();
  do {
    ms_new = millis();
    if ( (ms_new - ms_old) > 1000) //important use 'greater than'
    {
      ms_old = millis();
      counter++;
     // Serial.print(counter);
     // Serial.print(" ");      
    }
  } while ( counter<5); // 1분마다한번씩 정보전송!
  //Serial.println("->");*/

 

}
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
