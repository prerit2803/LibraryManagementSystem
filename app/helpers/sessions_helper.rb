module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
    session[:user_email] = user.email
    session[:user_full_name] = user.full_name

  end

  def logged_in?
    !current_user.nil?
  end


  def log_out
    session.delete(:user_id)
    session.delete(:user_email)
    session.delete(:user_full_name)
    session.delete(:user_usertype)
    @current_user = nil
  end
end
