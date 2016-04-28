1. Temperature/Humidity control through electric fan (automatic)
2. Temperature/Humidity control through infrared lamp (automatic)
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

3. Drying feature (on demand)

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

4. Sterilization function (on demand)

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

5. Deodorization function (on demand)

boolean check_demand_deodorization

function demand_control_deodorization(){
	if(check_demand_deodorization == true){
		deodorization_on()
		check_demand_deodorization = false
	}
}

6. Deodorization function (automatic)

function auto_control_deodorization(){
	deotoranzation_on()
	delay(one hour) // one hour interval
}

7. Intensity control feature (3 states of intensity)

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