module MyboxHelper
  def save_shoe
    if params[:choice] == "WalkingShoes"
    	Shoe.create(user_id: current_user.id,
    		shoename: params[:shoename],
            shoetype: "WalkingShoes",
    		purpose: "walk",
    		color: params[:color],
    		watersensitivity: 40,
    		odorsensitivity: 50,
    		predictedlife: 1000,
    		weight: 320,
    		preference: 80 
    		)
    elsif params[:choice] == "Highhill"
    	Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
    		shoetype: "Highhill",
    		purpose: "official",
    		color: params[:color],
    		watersensitivity: 80,
    		odorsensitivity: 20,
    		predictedlife: 300,
    		weight: 330,
    		preference: 60 
    		)	
    end
  end
end
