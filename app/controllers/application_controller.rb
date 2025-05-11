class ApplicationController < ActionController::API

  before_action :authenticate_user!



  private


  def authenticate_user!
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    p "session"
    p '--------------------------------'
    p session[:expires_at]
    p Time.current
    p session[:user_id]
    if session[:expires_at] && Time.current < session[:expires_at]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      session[:user_id] = nil
      session[:expires_at] = nil
      nil
    end
  end
end
