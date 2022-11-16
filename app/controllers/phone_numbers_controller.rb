class PhoneNumbersController < ApplicationController
  before_action :authorized_user
  def new
    @user = User.find(params[:user_id])
    @phone_number = @user.phone_numbers.build
  end

  def create
    @user = User.find(params[:user_id])
    @phone_number = @user.phone_numbers.build(phone_number_params)
    if @phone_number.save
      flash[:success] = "New number saved. Please verify."
      redirect_to current_user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def phone_number_params
      params.require(:phone_number).permit(:number)
    end

    def authorized_user
      if logged_in?
        @user = User.find_by(id: params[:user_id])
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
