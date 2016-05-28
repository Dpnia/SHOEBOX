class MyboxController < ApplicationController
  def information
    	
  end

  def new
  	
  end

  def add  	
  	save_shoe  	
    render 'information'
  end

  def destroy
  	@shoe = Shoe.find(params[:id])
  	@shoe.destroy
  	render 'information'
  end

  def detail
  	@shoe = Shoe.find(params[:id])
  end

end
