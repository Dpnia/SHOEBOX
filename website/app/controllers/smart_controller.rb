class SmartController < ApplicationController
  def index
  end

  def change
  	current_user.ipaddress = params[:ipaddress]
  	current_user.save
  	render 'index'
  end
end
