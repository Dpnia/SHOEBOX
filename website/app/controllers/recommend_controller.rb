class RecommendController < ApplicationController
  def index 
  end
  def recommend
  	@temperature = :temp1
  	@huminity = params[:humi1]
  end
end
