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
    s.save
    end
  end
end
