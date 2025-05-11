class SessionsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:create]
  
  def create
    user = User.find_by(username: params[:username])
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expires_at] = 24.hours.from_now
      
      render json: {
        user: {
          id: user.id,
          username: user.username,
          full_name: user.full_name,
          role: user.role
        }
      }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    session[:expires_at] = nil
    render json: { message: 'Logged out successfully' }, status: :ok
  end


end 