class PhoneNumberVerificationsController < ApplicationController
  def new
    @phone_number = PhoneNumber.find_by(id: params[:id])
  end

  def update
    @phone_number = PhoneNumber.find_by(id: params[:id])
    if params[:code] == "12345"
      flash[:success] = "Phone Number Verified"
      @phone_number.toggle!(:verified)
      redirect_to user_phone_number_path(current_user, @phone_number)
    else
      flash[:danger] = "Code entered is invalid"
      render 'new', status: :see_other
    end 
  end
end
