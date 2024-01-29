module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    $user_type = 1
  end

  def log_in2(user)
    session[:user_id] = user.id
    $user_type = 2
  end

 
  def current_user
  	 if $user_type == 1
  		@current_user ||= User.find_by(id: session[:user_id])
  	 elsif $user_type == 2
  	 	@current_user ||= RestaurantStaff.find_by(id: session[:user_id])
  	end
  end

  def logged_in?
    current_user.is_a?(User)
  end

  def logged_in2?
    current_user.is_a?(RestaurantStaff)
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    @user_type = nil
  end

end
