module SessionsHelper
  def login_user(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to user_url(user)
  end

  def logged_in?(user)
    current_user?(user)
  end

  def logout_user
    self.current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to "/"
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def current_user?(user)
    user.session_token == session[:session_token] ? true : false
  end
end
