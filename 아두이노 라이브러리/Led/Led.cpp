#include "Led.h"
#include "WProgram.h"

Led::Led(int pin0, int on, int off) {
    numOfLeds = 1;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    ledState[0] = LED_OFF;
}
            
Led::Led(int pin0, int pin1, int on, int off) {
    numOfLeds = 2;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
}

Led::Led(int pin0, int pin1, int pin2, int on, int off) {
    numOfLeds = 3;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    pin[2] = pin2;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
    ledState[2] = LED_OFF;
}

Led::Led(int pin0, int pin1, int pin2, int pin3, int on, int off) {
    numOfLeds = 4;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    pin[2] = pin2;
    pin[3] = pin3;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
    ledState[2] = LED_OFF;
    ledState[3] = LED_OFF;
}

Led::Led(int pin0, int pin1, int pin2, int pin3, int pin4, int on, int off) {
    numOfLeds = 5;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    pin[2] = pin2;
    pin[3] = pin3;
    pin[4] = pin4;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
    ledState[2] = LED_OFF;
    ledState[3] = LED_OFF;
    ledState[4] = LED_OFF;
}

Led::Led(int pin0, int pin1, int pin2, int pin3, int pin4, int pin5, int on, int off) {
    numOfLeds = 6;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    pin[2] = pin2;
    pin[3] = pin3;
    pin[4] = pin4;
    pin[5] = pin5;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
    ledState[2] = LED_OFF;
    ledState[3] = LED_OFF;
    ledState[4] = LED_OFF;
    ledState[5] = LED_OFF;
}

Led::Led(int pin0, int pin1, int pin2, int pin3, int pin4, int pin5, int pin6, int on, int off) {
    numOfLeds = 7;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    pin[2] = pin2;
    pin[3] = pin3;
    pin[4] = pin4;
    pin[5] = pin5;
    pin[6] = pin6;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
    ledState[2] = LED_OFF;
    ledState[3] = LED_OFF;
    ledState[4] = LED_OFF;
    ledState[5] = LED_OFF;
    ledState[6] = LED_OFF;
    
}

Led::Led(int pin0, int pin1, int pin2, int pin3, int pin4, int pin5, int pin6, int pin7, int on, int off) {
    numOfLeds = 8;
    HwLedOnState = on;
    HwLedOffState = off;
    pin[0] = pin0;
    pin[1] = pin1;
    pin[2] = pin2;
    pin[3] = pin3;
    pin[4] = pin4;
    pin[5] = pin5;
    pin[6] = pin6;
    pin[7] = pin7;
    ledState[0] = LED_OFF;
    ledState[1] = LED_OFF;
    ledState[2] = LED_OFF;
    ledState[3] = LED_OFF;
    ledState[4] = LED_OFF;
    ledState[5] = LED_OFF;
    ledState[6] = LED_OFF;
    ledState[7] = LED_OFF;
    
}

int  Led::State(int led_num){  // led _num starts from zero

    return ledState[led_num];
}

int Led::StateByPinNum(int pin_num) {
    int i;
    
    for(i=0; i < numOfLeds; i++)
    {
        if(pin[i] == pin_num)
            return ledState[i];
    }
    
    return LED_OFF;  // error. default return value.
}

void Led::Control(int led_num, int onoff){

    if(onoff == LED_ON)
    {
        digitalWrite(pin[led_num], HwLedOnState);
        ledState[led_num] = LED_ON;
    }
    else if(onoff == LED_OFF)
    {
        digitalWrite(pin[led_num], HwLedOffState);
        ledState[led_num] = LED_OFF;
    }
}

void Led::AllControl(int onoff){
    int i;
    
    if(onoff == LED_ON)
        for(i=0; i < numOfLeds; i++)
        {
            digitalWrite(pin[i], HwLedOnState);
            ledState[i] = LED_ON;
        }
    else if(onoff == LED_OFF)
        for(i=0; i < numOfLeds; i++)
        {
            digitalWrite(pin[i], HwLedOffState);
            ledState[i] = LED_OFF;
        }
}

int Led::toggle(int led_num){

    if(ledState[led_num] == LED_ON){
        digitalWrite(pin[led_num], HwLedOffState);
            ledState[led_num] = LED_OFF;
    }
    else if (ledState[led_num] == LED_OFF){
        digitalWrite(pin[led_num], HwLedOnState);
            ledState[led_num] = LED_ON;
    }
    
    return ledState[led_num];
}

void Led::PWM(int led_num, int cycle){

    analogWrite(pin[led_num], cycle);

}

void Led::initialize(){
    int i;
    
    for(i=0; i < numOfLeds; i++)
        pinMode(pin[i], OUTPUT);
}