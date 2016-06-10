class RecommendController < ApplicationController
  def index 
 
  end
 
  def result
  	
  	@temperature = params[:temp1].to_i
    @huminity = params[:humi1].to_i
    @weather = params[:weather]
    @purpose = params[:choice]
  	current_user.shoes.each do |s|
  	  s.recommendindex = 0
  	  
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
