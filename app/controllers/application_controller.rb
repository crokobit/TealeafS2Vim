class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    user ||= User.find(session[:user_id]) if session[:user_id] #Notice!! user_id is in session[]
  #Need if 'session[:user_id]' !!
  end
  
  def require_user
    if !logged_in?
      flash[:error] = 'Not logged in'
      redirect_to root_path
    end
  end

  def require_admin
    if !current_user.admin?
      flash[:error] = 'Not admin'
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end

end
