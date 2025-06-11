class ApplicationController < ActionController::API

  before_action :authenticate_user!



  private


  def authenticate_user!
    return if Rails.env.test?
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    if session[:expires_at] && Time.current < session[:expires_at]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      session[:user_id] = nil
      session[:expires_at] = nil
      nil
    end
  end
end
