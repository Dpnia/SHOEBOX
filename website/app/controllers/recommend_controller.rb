class RecommendController < ApplicationController
  def index 
 
  end
 
  def result
  	
  	@temperature = params[:temp1].to_i

    @huminity = params[:humi1].to_i
    @weather = params[:weather].to_s
    @choice = params[:choice].to_s
  	current_user.shoes.each do |s|
  	  s.recommendindex = 0

  	  if @choice == "jogging" && s.jogging == true
  	  	s.recommendindex += 30
  	  elsif @choice == "casual" && s.casual == true
  	  	s.recommendindex += 30
  	  elsif @choice == "sports" && s.sports == true
  	  	s.recommendindex += 30
  	  elsif @choice == "trip" && s.trip == true
  	  	s.recommendindex += 30
  	  elsif @choice == "storll" && s.storll == true
  	  	s.recommendindex += 30
  	  elsif @choice == "official" && s.official == true
  	  	s.recommendindex += 30
  	  elsif @choice == "date" && s.date == true
  	  	s.recommendindex += 30
  	  elsif @choice == "business" && s.business == true
  	  	s.recommendindex += 30
  	  elsif @choice == "soccer" && s.soccer == true
  	  	s.recommendindex += 30
  	  elsif @choice == "basketball" && s.basketball == true
  	  	s.recommendindex += 30
  	  elsif @choice == "house" && s.house == true
  	  	s.recommendindex += 30	
  	  end


    

      if @temperature > 30 && s.warmth <= 40
       	s.recommendindex += 20
	  elsif 20 < @temperature && 30 >= @temperature && s.warmth <= 50
	    s.recommendindex += 20
	  elsif 10 < @temperature && 20 >= @temperature && s.warmth <= 60
	    s.recommendindex += 20
	  elsif @temperature <= 10 && s.warmth > 60
	    s.recommendindex += 20
	  elsif @temperature <= 0 && s.warmth >= 80
        s.recommendindex +=20

      end

      /weather에 따른 인덱스 변화/

      if  @weather == "Rain" || @weather == "Snow" && s.color == "white"  
           s.recommendindex -= 20 
      elsif @weather == "Rain" || @weather == "Snow" && s.color == "yellow" 
           s.recommendindex -= 10
      elsif@weather == "Rain" || @weather == "Snow" && s.color == "black"
            s.recommendindex += 30
      elsif @weather == "Rain" || @weather == "Snow" && s.color == "purple"
            s.recommendindex += 20
      elsif@weather == "Rain" || @weather == "Snow" && s.color == "blue"
            s.recommendindex += 20
      elsif @weather == "Rain" || @weather == "Snow" && s.color == "red"
            s.recommendindex += 10
      end
          /preference에 따른 Index 변화/
      if 10 < s.preference &&  30 >=s.preference 
            s.recommendindex +=5
	  elsif 30 < s.preference &&  50 >=s.preference 
                 s.recommendindex +=10
      elsif 50 < s.preference &&  70 >=s.preference 
                 s.recommendindex +=15
      elsif 70 < s.preference &&  90 >=s.preference 
                 s.recommendindex += 20
      elsif 90 < s.preference &&  100 >=s.preference 
                 s.recommendindex +=25
      end  

      if @choice == "jogging" &&  60< s.activity 
        s.recommendindex += 5
      elsif @choice == "casual" && 20< s.activity 
        s.recommendindex += 5
      elsif @choice == "sports" && 70< s.activity 
        s.recommendindex += 5
      elsif @choice == "trip" &&  40< s.activity 
        s.recommendindex += 5
      elsif @choice == "storll" &&  5< s.activity 
        s.recommendindex += 5
      elsif @choice == "official" &&  10< s.activity 
        s.recommendindex += 5
      elsif @choice == "date" &&  30< s.activity 
        s.recommendindex += 5
      elsif @choice == "business" && 20< s.activity 
        s.recommendindex += 5
      elsif @choice == "soccer" &&  70< s.activity 
        s.recommendindex += 5
      elsif @choice == "basketball" &&  70< s.activity 
        s.recommendindex += 5
      elsif @choice == "house" &&  0< s.activity && s.activity <=10
        s.recommendindex += 5 
      end


     s.save
    end
  end
end
