class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_usertype] = user.usertype
      log_in user
      redirect_to user, notice: 'Logged in Successfully.!!'
    else
      flash.now[:danger] = 'Invalid Email/Password. Try again.  '
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = 'Logged out Successfully..!!'
    redirect_to root_url
  end
end
