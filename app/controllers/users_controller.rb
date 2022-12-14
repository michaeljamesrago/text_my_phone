class UsersController < ApplicationController
  before_action :authorized_user, only: [:show, :edit, :update, :destroy]

  def index
    unless current_user.admin?
      flash[:danger] = "You are not authorized to view this page"
      redirect_to current_user
    end
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    add_breadcrumb(@user.name, @user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email for the link to activate your account"
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to login_path, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def authorized_user
      if logged_in?
        @user = User.find_by(id: params[:id])
        unless !!@user && @user == current_user
          flash[:danger] = "You are not authorized to view the requested page"
          redirect_to current_user
        end
      else
        flash[:danger] = "You must log in to view the requested page"
        redirect_to login_path
      end
    end
end
