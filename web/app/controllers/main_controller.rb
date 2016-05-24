class MainController < ApplicationController
  def index
  end

  def new
  end

  def create
  	User.create(
  		name: params[:name],
  		email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation])
  	redirect_to '/main/member'
  end

  def member
  	@users = User.all
  end
end
