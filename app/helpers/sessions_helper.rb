module SessionsHelper
  # Logs in user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns current logged-in user if any
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if a user is logged in, false if not
  def logged_in?
    !current_user.nil?
  end

  # Logs out current user
  def log_out
    reset_session
    @current_user = nil
  end
end
