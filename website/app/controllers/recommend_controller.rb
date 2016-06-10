class RecommendController < ApplicationController
  def index 
  end
  def result
  	@shoe = Shoe.find(current_user.id)
  	@temperature = params[:temp1]
  	@huminity = params[:humi1]
  	@recommendindex
  end
end
