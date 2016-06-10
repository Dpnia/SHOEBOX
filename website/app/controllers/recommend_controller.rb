class RecommendController < ApplicationController
  def index 
  end
  def result
  	@temperature = params[:temp1]
  	@huminity = params[:humi1]
  end
end
