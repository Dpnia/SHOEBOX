class RecommendController < ApplicationController
  def index 
  end
  def result
  	@temperature = :temp1
  	@huminity = params[:humi1]
  end
end
