function check_temperature( ){
if (temperature > 25 or temperature < 10) {
  return false
	else
	  return true
}
function check_humidity( ){
if (humidity > 60 or humidity < 40) 
	  return false
	else
	  return true
}

function control_temperature_humidity(){
	while(!check_teperature() and !check_humidity()){
	  fan_on()
	  lamp_on()
	}
} 
