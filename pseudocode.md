A.OPTIMIZATION FUNCTION
(1) Temperature/Humidity control through electric fan (automatic)
(2) Temperature/Humidity control through ultraviolet lamp (automatic)

// Check temperature and humidity and optimize automatically
function check_temperature(){
	if (temperature < 15) {
		return false
	else
		return true
}
//When humidity is less than 40, it is better to have higher temperature

function check_humidity(){
	if (humidity > 40 ) 
		return false
	else
		return true
}

//실내 적정 습도가 50~60%이고 신발장은 40%이하가 적절하다고 합니다

function auto_control_temperature_humidity(){
	if(check_teperature() == true and check_humidity() == true){
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

fucntion fan_on(int a){
	if a==3 // turn fan MAX
	else if a==2 //  turn fan MID
	else // turn fan MIN
}

fucntion lamp_on(int a){
	if a==3 // turn lamp MAX
	else if a==2 // turn lamp MID
	else // turn lamp MIN
}

B.Management function 
(1)	 Shoe categorization function (serial number scanning) // 나중에 데이터 베이스 구성할떄 제품 번호가 더욱 편할거 같아요
(2)	 Shoe categorization function (user input based)
(3)	 Shoe categorization function (captured image)
(4)	 Shoe categorization function (3D scanning)
(5)	 Setting the proper management tool

C.	Analysis function
(1)	 Absence of shoes analysis (Base information)

int absence_time

function check_absense(){
	if (weight_sensor == 0) 
		absence_timer_on()
	else
		absence_timer_off()
}

(2)	 Durability analysis
// 평균적으로 하루에 운동화를 12시간 신는다고 가정(8:00~20:00)
// average time wearing shoes : 12 hours a day
string durability 

function check_durability(){
	if absence_time < 2 weeks 
		durability = new one
	else if 2 weeks < absence_time < 4 weeks
		durability = not bad
	else if 4 weeks < absence_time < 8 weeks
		durability = need an washing at least once
	else if 8 weeks < absence_time < 16 weeks
		durability = be careful
	else
		durability = recommend to buy new one	
}

(3)	 Life prediction analysis
// 신발에 할당된 고유번호
int shoes_number // assigned number for each shoes 
int life_time

function check_life_time(int shoes_number, int absence_time) {
	life_time = original_life_time(shoes_number) - absence_time
	return life_time
}

(4)	 Preference analysis (personal)
(5)	 Preference analysis (general)

int count_using_time = absence_time
int preference // server variable

function check_preference(){
	if count_using_time > 2 weeks {
		count_using_time = count_using_time - 2 weeks 
		// one week use : preference + 1
		preference = preference + 1 
	}
}

(6)	 Frequency analysis

int use_date

function check_frequency(){
		return use_date / whole_date * 100
}

(7)	 Walking habit analysis (health care)
//형 이건 그냥 빼버리죠?ㅜㅜ // document 작성하면서 생각해볼것 

D.	Recommendation function 
(1)	 Recommendation based on weather forecast 

string weather

fuction weather_forcast(String Weather){ // from weather API
	if(Weather='sunny'){
	return 1;
}
else if(Weather='cloudy'){
	return 2;
}
else if(Weather='rainy' or Weather='snowy'){
	return 3;
}
}
function recommend_weatherforcast(){
	switch(Weather_forcast()){
	case 1 : return shoes1 
	case 2 : return shoes2 
	case 3 : return shoes3  // sunny -> shoes1,2,3  cloudy -> shoes2,3  rainy -> shoes3 
			break
	}
}

(2)	 Recommendation based on the use of shoes

string user_purpose

function recommend_user_purpose(){
	if user_purpose == exercise
		return shoe1
	else if user_purpose == office(formal)
		return shoe2
	else if user_purpose == (informal)
		return shoe3
} 

(3)	 Recommendation based on the color of shoes

fuction recommned_color(class shoe){
	if shoe.color matches clothes.color
		return recommend
	else
		return not recommended
}

(4)	 Notice of recommendation rate by color
(5)	 Notice of recommendation rate by percentage

function notice_recommedation(class shoe) {
	if recomedation_rate > 80
		recommedation_color = green
		display recommedation_rate, recommedation_color
	else if 60 < recomedation_rate < 80
		recommedation_color = lightgreen
		display recommedation_rate, recommedation_color
	else if 40 < recomedation_rate < 60
		recommedation_color = orange
		display recommedation_rate, recommedation_color
	else if recomedation_rate < 40
		recommedation_color = red
		display recommedation_rate, recommedation_color
}

E.	Notification function 
(1)	 Recognition of contamination by sensor
(2)	 Notification for contamination by message

function check_contamination(){
	if weight_sensor_now > weight_sensor_average + 20 // 평소보다 약 20g정도 더 무게가 측정이 된다면
		notification_message()
}

F.	Networking / Remote control function (UI)
(1)	 Control function through web programming (main)
(2)	 Control function through mobile (sub)
(3)	 Control function through embedded system (sub)
