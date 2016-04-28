A.OPTIMIZATION FUNCTION
(1) Temperature/Humidity control through electric fan (automatic)
(2) Temperature/Humidity control through infrared lamp (automatic)
(temperature in celcius and humidity in percentage)
//Check temperature and humidity and optimize automatically
function check_temperature(){
	if (temperature > 25 or temperature < 10) {
		return false
	else
		return true
}

function check_humidity(){
	if (humidity > 60 or humidity < 40) 
		return false
	else
		return true
}

function auto_control_temperature_humidity(){
	if(check_teperature() == true and check_humidity() == true and){
		fan_off()
		lamp_off()
	}
	else{
		fan_on(MID)
		lamp_on(MID)
	}
}

(3) Drying feature (on demand)

boolean check_demand_drying

function demand_control_temperatureHumidity(){
	if(check_demand_drying == false){
		fan_off()
		lamp_off()
	}
	else{
		fan_on(MAX)
		lamp_on(MID)
	}
}

(4) Sterilization function (on demand)

boolean check_demand_sterilization

function demand_control_temperature_humidity(){
	if(check_demand_sterilization == false){
		fan_off()
		lamp_off()
	}
	else{
		fan_on(MID)
		lamp_on(MAX)
	}
}

(5) Deodorization function (on demand)

boolean check_demand_deodorization

function demand_control_deodorization(){
	if(check_demand_deodorization == true){
		deodorization_on()
		check_demand_deodorization = false
	}
}

(6) Deodorization function (automatic)

function auto_control_deodorization(){
	deotoranzation_on()
	delay(one hour) // one hour interval
}

(7) Intensity control feature (3 states of intensity)

define MAX 3
define MID 2
define MIN 1

fucntion fan_on(int a){
	if a==3
		//STRONG
	else if a==2
		//NORMAL
	else
		//LOW
}

fucntion lamp_on(int a){
	if a==3
		//STRONG
	else if a==2
		//NORMAL
	else
		//LOW
}

B.Management function 
(1)	 Shoe categorization function (bar-code scanning)
(2)	 Shoe categorization function (user input based)
(3)	 Shoe categorization function (captured image)
(4)	 Shoe categorization function (3D scanning)
(5)	 Setting the proper management tool

C.	Analysis function
(1)	 Absence of shoes analysis (Base information)
(2)	 Durability analysis
(3)	 Life prediction analysis
(4)	 Preference analysis (personal)
(5)	 Preference analysis (general)
(6)	 Frequency analysis
(7)	 Walking habit analysis (health care)

D.	Recommendation function 
(1)	 Recommendation based on weather forecast 

fuction weather_forcast(String Weather){ // from weather API
	if(Weather='sunny'){
	return 1;
}
else if(Weather='cloud'){
	return 2;
}
else if(Weather='rain' or Weather='snow'){
	return 3;
}
}
fuction Recommend_Weatherfrecast(){
	switch(Weather_forcast()){
	case 1 : return shoes1 
	case 2 : return shoes2 
	case 3 : return shoes3  // sunny -> shoes1,2,3  cloud -> shoes2,3  rain -> shoes3 
			break
}
}

(2)	 Recommendation based on the use of shoes


(3)	 Recommendation based on the color of shoes
(4)	 Notice of recommendation rate by color
(5)	 Notice of recommendation rate by percentage

E.	Notification function 
(1)	 Recognition of contamination by sensor
(2)	 Notification for contamination by message

F.	Networking / Remote control function (UI)
(1)	 Control function through web programming (main)
(2)	 Control function through mobile (sub)
(3)	 Control function through embedded system (sub)
