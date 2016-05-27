class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
  	User.create(
  		name: params[:name],
  		email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
  		ipaddress: params[:ipaddress])
  	redirect_to :root
  end

  def member
  	@users = User.all
  end
end
