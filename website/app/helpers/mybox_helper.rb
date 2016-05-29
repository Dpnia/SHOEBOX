module MyboxHelper
  def save_shoe
    if params[:choice] == "suede WalkingShoes"
    	Shoe.create(user_id: current_user.id,
    		shoename: params[:shoename],
            shoetype: "suede WalkingShoes",
    		purpose: "walk","jogging","casual","sports","trip","stroll"
    		color: params[:color],
    		watersensitivity: 40,
    		odorsensitivity: 50,
            warmth: 50,
    		predictedlife: 2000,
    		weight: 320,
    		preference: 80, 
            frequency: 13%
    		)
    elsif params[:choice] == "artificial leather Highhill"
    	Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
    		shoetype: "artificial leather Highhill",
    		purpose: "official","casual","date"
    		color: params[:color],
    		watersensitivity: 90,
    		odorsensitivity: 30,
            warmth: 20
    		predictedlife: 500,
    		weight: 430,
    		preference: 60, 
            frequency: 8%
    		)
    elsif params[:choice] == "artificial casual Jogging shoes"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "artificial casual Jogging shoes","stroll"
            purpose: "Jogging",
            color: params[:color],
            watersensitivity: 70,
            odorsensitivity: 55,
            predictedlife: 600,
            warmth:25
            weight: 370,
            preference: 60,
            frequency: 3% 
            )
    elsif params[:choice] == "leather walker"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "leather walker",
            purpose: "official","casual","date"
            color: params[:color],
            watersensitivity: 80,
            odorsensitivity: 20,
            warmth: 75
            predictedlife: 1500,
            weight: 650,
            preference: 60, 
            frequency: 11%
            )
    elsif params[:choice] == "leather business shoes"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "leather business shoes",
            purpose: "official",
            color: params[:color],
            watersensitivity: 75,
            odorsensitivity: 25,
            warmth:65
            predictedlife: 1000,
            weight: 530,
            preference: 60, 
            frequency:20%
            )
    elsif params[:choice] == "converse casual"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "converse casual","trip","stroll"
            purpose: "casual","date",
            color: params[:color],
            watersensitivity: 30,
            odorsensitivity: 15,
            warmth: 20
            predictedlife: 720,
            weight: 230,
            preference: 60,
            frequency:17%
            )
    elsif params[:choice] == "suede casual"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "suede casual",
            purpose: "casual","date","trip","stroll"
            color: params[:color],
            watersensitivity: 35,
            odorsensitivity: 25,
            warmth: 25
            predictedlife: 850,
            weight: 380,
            preference: 60, 
            frequency: 10%
            )
    elsif params[:choice] == "suede business"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "suede business",
            purpose: "business","casual","date"
            color: params[:color],
            watersensitivity: 35,
            odorsensitivity: 25,
            warmth: 45,
            predictedlife: 550,
            weight: 350,
            preference: 60,
            frequency: 8%
            )
    elsif params[:choice] == "soccer shoe"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "soccer shoe",
            purpose: "soccer",
            color: params[:color],
            watersensitivity: 90,
            odorsensitivity: 10,
            warmth: 50,
            predictedlife: 820,
            weight: 450,
            preference: 60,
            frequency:1%


            )
    elsif params[:choice] == "rain boots"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "rain boots",
            purpose: "casual","date","trip","stroll"
            color: params[:color],
            watersensitivity: 100,
            odorsensitivity: 10,
            warmth: 50,
            predictedlife: 1000,
            weight: 600,
            preference: 60, 
            frequency: 3%
            )
     elsif params[:choice] == "baskit ball shoe"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "baskit ball shoe",
            purpose: "baskit ball",
            color: params[:color],
            watersensitivity: 50,
            odorsensitivity: 80,
            warmth: 50,
            predictedlife: 680,
            weight: 750,
            preference: 60, 
            frequency:1%
            )
  
   elsif params[:choice] == "suede slippers"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "suede slippers",
            purpose: "house","trip","stroll"
            color: params[:color],
            watersensitivity: 10,
            odorsensitivity: 10,
            warmth:10
            predictedlife: 250,
            weight: 130,
            preference: 60,
            frequency:3% 
            )
     elsif params[:choice] == "leather silppers"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "leather slippers"
            purpose: "stroll","casual","trip",
            color: params[:color],
            watersensitivity: 15,
            odorsensitivity: 15,
            warmth:10
            predictedlife: 200,
            weight: 170,
            preference: 60,
            frequency:2%
            )





    end
  end
end
