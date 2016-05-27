#ifndef LED_H
#define LED_H


enum led_state_type { LED_OFF=0, LED_ON};

class Led {
    public :
        Led(int pin0, int on, int off);
        Led(int pin0, int pin1, int on, int off);
        Led(int pin0, int pin1, int pin2, int on, int off);
        Led(int pin0, int pin1, int pin2, int pin3, int on, int off);
        Led(int pin0, int pin1, int pin2, int pin3, int pin4, int on, int off);
        Led(int pin0, int pin1, int pin2, int pin3, int pin4, int pin5, int on, int off);
        Led(int pin0, int pin1, int pin2, int pin3, int pin4, int pin5, int pin6, int on, int off);
        Led(int pin0, int pin1, int pin2, int pin3, int pin4, int pin5, int pin6, int pin7, int on, int off);
        void initialize(void);
        int State(int led_num);
        int StateByPinNum(int pin_num);
        void Control(int led_num, int onoff);
        void PWM(int led_num, int cycle);
        void AllControl(int onoff);
        int toggle(int led_num);
    private :
        int numOfLeds;
        int pin[8];
        int index;
        int ledState[8];
        int HwLedOnState;
        int HwLedOffState;
};

#endif