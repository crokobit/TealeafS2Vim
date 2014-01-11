class SessionsController < ApplicationController

  def new
    #login
  end

  def create
    #login post
    user = User.where(name: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Login success'
      redirect_to root_path
    else
      flash[:error] = 'Wrong'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logout'
    redirect_to root_path
  end
end
