class WeatherController < ApplicationController
  def index

  end

  def change
    current_user.city = params[:city]
    current_user.save
    render 'index'
  end

  def seoul
  	
  end

  def busan
  	
  end

  def daegu
  	
  end

end
