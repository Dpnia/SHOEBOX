#include <SoftwareSerial.h>
#include <stdlib.h>
#include "DHT.h"

SoftwareSerial SoftSerial(2, 3); // RX, TX

#define DHTPIN 4     // what pin we're connected to
#define DHTTYPE DHT11   // DHT 22  (AM2302)

DHT dht(DHTPIN, DHTTYPE);


// replace with your channel's thingspeak API key
String apiKey = "5GYVWZQH0VFZRAT6";
int exit_flag = 0;
char SoftSerial_read;
int ms_old, ms_new;

// this runs once
void setup() {
  // enable debug serial
  Serial.begin(9600);
  // enable software serial
  SoftSerial.begin(9600);

  Serial.println("============ARDUINO START============");

  // reset ESP8266
  SoftSerial.println("AT+RST");

  exit_flag = 0;
  ms_old = millis();
  do {
    ms_new = millis();
    if (SoftSerial.available())
    {
      SoftSerial_read = SoftSerial.read();
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
float temp, humi;
int counter=0;
// the loop
void loop() {

  humi = dht.readHumidity();
  temp = dht.readTemperature();
  if (isnan(humi) || isnan(temp) ) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  } else
  {
    Serial.print("temperature:");
    Serial.print(temp);
    Serial.print(" humidity:");
    Serial.print(humi);
    Serial.println();
  }

  // convert to string
  char buf[16];
  String strTemp = dtostrf(temp, 4, 1, buf);
  String strTemp2 = dtostrf(humi, 4, 1, buf);

  // TCP connection
  String cmd = "AT+CIPSTART=\"TCP\",\"";
  cmd += "184.106.153.149"; // api.thingspeak.com
  cmd += "\",80";
  SoftSerial.println(cmd);

  exit_flag = 0;
  ms_old = millis();
  do {
    ms_new = millis();
    if (SoftSerial.available())
    {
      SoftSerial_read = SoftSerial.read();
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
  getStr += "\r\n\r\n";

  // send data length
  cmd = "AT+CIPSEND=";
  cmd += String(getStr.length());
  SoftSerial.println(cmd);
  //Serial.println(cmd);

  exit_flag = 0;
  ms_old = millis();
  do {
    ms_new = millis();
    if (SoftSerial.available())
    {
      SoftSerial_read = SoftSerial.read();
      Serial.write(SoftSerial_read);
      if (SoftSerial_read == '>' )
      {
        exit_flag = 1;
        SoftSerial.print(getStr);
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
    if (SoftSerial.available())
    {
      SoftSerial_read = SoftSerial.read();
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
  Serial.println("\n\rwait for 15 second");
  Serial.println("------------------------------------");

  counter=0;
  ms_old = millis();
  do {
    ms_new = millis();
    if ( (ms_new - ms_old) > 1000) //important use 'greater than'
    {
      ms_old = millis();
      counter++;
      Serial.print(counter);
      Serial.print(" ");      
    }
  } while ( counter<60);
  Serial.println("->");

  }
