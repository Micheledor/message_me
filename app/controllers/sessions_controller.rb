class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def signup
    user = User.new
  end

  def register
    user = User.new(username: params[:session][:username], password: params[:session][:password])
    if user.save
      user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully registered in'
      redirect_to root_path
    else
      flash.now[:error] = 'You need to enter a valid e-mail and a valid password to register'
      render 'new'
    end
  end  
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'Wrong credentials'
      render 'new'
    end  
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You logged out succesfully'
    redirect_to login_path
  end  

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to root_path
    end  
  end  
end