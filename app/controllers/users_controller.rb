class UsersController < ApplicationController

  before_action :set_user,only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update] 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Created user success'
      redirect_to root_path
    else
      render :new 
    end
  end

  def edit; end
  
  def update
    if @user.update(user_params)
      flash[:notice] = 'Update success'
      redirect_to users_path
    else
      render :edit
    end
  end

  def show; end

  def index

  end

  def set_user
    @user = User.find(params[:id])
  end 
  
  def require_same_user
    if params[:id].to_i != session[:user_id]
      flash[:error] = 'Require same user'
      redirect_to root_path 
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:password, :name)
  end
end
