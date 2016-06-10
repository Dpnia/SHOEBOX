class RecommendController < ApplicationController
  def index 
 
  end
 
  def result
  	@shoe = Shoe.all
  	@temperature = params[:temp1]
    @huminity = params[:humi1]
  	@shoe.each do |s|
  	  s.recommendindex = 0
  	  if s["params[:choice]"] == true
    	s.recommendindex += 20
      end
      if @temperature > 30 && s.warmth < 40
       	s.recommendindex += 20
    
	  elsif 20 < @temperature < 30 && s.warmth < 50
	    s.recommendindex += 20

	  elsif 10< @temperature < 20 && s.warmth < 60
	    s.recommendindex += 20
	  elsif @temperature < 10 && s.warmth > 60
	    s.recommendindex += 20
	  elsif @temperature < 0 && s.warmth >80
        s.recommendindex +=20
      end
    end
    @shoe.save
  end
end
