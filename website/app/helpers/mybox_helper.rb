module MyboxHelper
  def save_shoe
    if params[:choice] == "Suede WalkingShoes"
    	Shoe.create(user_id: current_user.id,
    		shoename: params[:shoename],
            shoetype: "Suede WalkingShoes",
    		color: params[:color],
    		watersensitivity: 40,
    		odorsensitivity: 50,
            warmth: 50,
    		predictedlife: 2000,
    		weight: 320,
    		preference: 80, 
            frequency: 13,

            jogging: true,
            casual: true,
            sports: true,
            trip: true,
            storll: true,
            official: false,
            date: false,
            business: false,
            soccer: false,
            basketball: false,
            house: false

    		)
    elsif params[:choice] == "Artificial Leather Highhill"
    	Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
    		shoetype: "Artificial Leather Highhill",
    		color: params[:color],
    		watersensitivity: 90,
    		odorsensitivity: 30,
            warmth: 20,
    		predictedlife: 500,
    		weight: 430,
    		preference: 60, 
            frequency: 8,

            jogging: false,
            casual: true,
            sports: false,
            trip: false,
            storll: false,
            official: true,
            date: true,
            business: false,
            soccer: false,
            basketball: false,
            house: false
    		)
    elsif params[:choice] == "Artificial Casual Jogging Shoes"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Artificial Casual Jogging Shoes",
            color: params[:color],
            watersensitivity: 70,
            odorsensitivity: 55,
            predictedlife: 600,
            warmth: 25,
            weight: 370,
            preference: 60,
            frequency: 3,
            
            jogging: true,
            casual: false,
            sports: false,
            trip: false,
            storll: true,
            official: false,
            date: false,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Leather Walker"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Leather Walker",
            color: params[:color],
            watersensitivity: 80,
            odorsensitivity: 20,
            warmth: 75,
            predictedlife: 1500,
            weight: 650,
            preference: 60, 
            frequency: 11,

            jogging: false,
            casual: true,
            sports: false,
            trip: false,
            storll: false,
            official: true,
            date: true,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Leather Business Shoes"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Leather Business Shoes",
            color: params[:color],
            watersensitivity: 75,
            odorsensitivity: 25,
            warmth: 65,
            predictedlife: 1000,
            weight: 530,
            preference: 60, 
            frequency:20,
            
            jogging: false,
            casual: false,
            sports: false,
            trip: false,
            storll: false,
            official: true,
            date: false,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Converse Casual"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Converse Casual",
            color: params[:color],
            watersensitivity: 30,
            odorsensitivity: 15,
            warmth: 20,
            predictedlife: 720,
            weight: 230,
            preference: 60,
            frequency:17,

            jogging: false,
            casual: true,
            sports: false,
            trip: true,
            storll: true,
            official: false,
            date: true,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Suede Casual"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Suede Casual",
            color: params[:color],
            watersensitivity: 35,
            odorsensitivity: 25,
            warmth: 25,
            predictedlife: 850,
            weight: 380,
            preference: 60, 
            frequency: 10,

            jogging: false,
            casual: true,
            sports: false,
            trip: true,
            storll: true,
            official: false,
            date: true,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Suede Business"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Suede Business",
            color: params[:color],
            watersensitivity: 35,
            odorsensitivity: 25,
            warmth: 45,
            predictedlife: 550,
            weight: 350,
            preference: 60,
            frequency: 8,

            jogging: false,
            casual: true,
            sports: false,
            trip: false,
            storll: false,
            official: false,
            date: true,
            business: true,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Soccer Shoe"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Soccer Shoe",
            color: params[:color],
            watersensitivity: 90,
            odorsensitivity: 10,
            warmth: 50,
            predictedlife: 820,
            weight: 450,
            preference: 60,
            frequency:1,

            jogging: false,
            casual: false,
            sports: false,
            trip: false,
            storll: false,
            official: false,
            date: false,
            business: false,
            soccer: true,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Rain boots"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "rain boots",
            color: params[:color],
            watersensitivity: 100,
            odorsensitivity: 10,
            warmth: 50,
            predictedlife: 1000,
            weight: 600,
            preference: 60, 
            frequency: 3,

            jogging: false,
            casual: true,
            sports: false,
            trip: true,
            storll: true,
            official: false,
            date: true,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    elsif params[:choice] == "Basketball Shoes"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Basketball shoes",
            color: params[:color],
            watersensitivity: 50,
            odorsensitivity: 80,
            warmth: 50,
            predictedlife: 680,
            weight: 750,
            preference: 60, 
            frequency: 1,
            
            jogging: false,
            casual: false,
            sports: false,
            trip: false,
            storll: false,
            official: false,
            date: false,
            business: false,
            soccer: false,
            basketball: true,
            house: false
            )
  
    elsif params[:choice] == "Suede Slippers"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Suede Slippers",
            color: params[:color],
            watersensitivity: 10,
            odorsensitivity: 10,
            warmth: 10,
            predictedlife: 250,
            weight: 130,
            preference: 60,
            frequency: 3,

            jogging: false,
            casual: false,
            sports: false,
            trip: true,
            storll: true,
            official: false,
            date: false,
            business: false,
            soccer: false,
            basketball: false,
            house: true
            )
    elsif params[:choice] == "Leather Silppers"
        Shoe.create(user_id: current_user.id,
            shoename: params[:shoename],
            shoetype: "Leather Slippers",
            color: params[:color],
            watersensitivity: 15,
            odorsensitivity: 15,
            warmth: 10,
            predictedlife: 200,
            weight: 170,
            preference: 60,
            frequency:2,

            jogging: false,
            casual: true,
            sports: false,
            trip: true,
            storll: true,
            official: false,
            date: false,
            business: false,
            soccer: false,
            basketball: false,
            house: false
            )
    end
  end
end
