class RecommendController < ApplicationController
  def index 
  end
  def result
  	@shoe = Shoe.find(current_user.id)
  	@purpose = params[:choice]
    @temperature = params[:temp1]
    @Raining_Snowing = params
  	@huminity = params[:humi1]
    @RecommendIndex = 0

    if@shoe.@purpose == true
    	RecommendIndex += 20
    
    if@temperature>30 && @shoe.warmth<40
        	 RecommendIndex += 20
    
	elsif 20<@temperature<30 && @shoe.warmth<50
	     RecommendIndex += 20

	elsif 10< @temperature < 20 && @shoe.warmth<60

	     RecommendIndex += 20


	elsif @temperature<10 && @shoe.warmth > 60
	    RecommendIndex += 20


	elsif @temperature<0 && @shoe.warmth >80
          RecommendIndex +=20

    

	    	
end
	
end
	
end

    
  end
end
