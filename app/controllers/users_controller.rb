class UsersController < ApplicationController
  layout 'nav', only: [:edit, :show, :index, :role, :managerole]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def createnew
    @user = User.new(user_params)

    if @user.save
      ActiveRecord::Base.transaction do
        @user.update_attributes(:usertype=>2, :check=> 0)
      end
      redirect_to users_path
    else
      render 'new'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
        log_in @user
      ActiveRecord::Base.transaction do
        @user.update_attributes(:usertype=>2, :check=> 0)
        session[:user_usertype] = @user.usertype
      end
      flash[:success] = 'Welcome to Library.'
      redirect_to @user
    else
      render 'new'
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Changes done successfully..!!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def manageadmin
    @user = User.find(params[:id])
    if @user.usertype == 2
      @user.update_attribute(:usertype, 1)
    elsif @user.usertype == 1
      @user.update_attribute(:usertype, 2)
    end
    redirect_to users_path
  end

  def role
    @user = User.find(params[:id])
  end

  def managerole
    @user = User.find(params[:id])
    if @user.update_attribute(:full_name, params[:user][:full_name])
      flash[:success] = 'Changes have been made successfully..!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :password_confirm, :can_book, :admin, :usertype, :check)
    end
end
