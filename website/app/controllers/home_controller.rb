class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def change
  	current_user.apikey = params[:apikey]
    current_user.save
    render 'index'
  end
end
