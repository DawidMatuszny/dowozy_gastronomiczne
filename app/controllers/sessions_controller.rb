class SessionsController < ApplicationController
  def new
  end

  def create
    user = find_user(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if @user_type == 1
      log_in user
      redirect_to root_path
      elsif @user_type == 2
      log_in2 user
      redirect_to root_path
      end
    else
      # Niedobrze
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def find_user(username)
    @user_type = 0

    if user = User.find_by(username: username)
      @user_type = 1
    elsif user = RestaurantStaff.find_by(username: username)
      @user_type=2
    end
    return user
  end
end
