class PhoneNumberVerificationsController < ApplicationController
  def new
    @phone_number = PhoneNumber.find_by(id: params[:id])
  end

  def update
    @phone_number = PhoneNumber.find_by(id: params[:id])
    if PhoneNumber.digest(params[:code]) == @phone_number.verification_digest
      @phone_number.toggle!(:verified)
      flash[:success] = "Phone Number Verified"
      redirect_to user_phone_number_path(current_user, @phone_number)
    else
      flash[:danger] = "Code entered is invalid"
      render 'new', status: :see_other
    end 
  end
end
