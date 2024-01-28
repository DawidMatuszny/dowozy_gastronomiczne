class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.find_by(username: params[:session][:username])
     if user && user.authenticate(params[:session][:password])
          # Wszystko dobrze, logujemy
          log_in user
          redirect_to User
     else
          # Niedobrze
          render 'new'
     end
  end

  def destroy
    log_out
    redirect_to User
  end
end
