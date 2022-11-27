class PhoneNumberVerificationsController < ApplicationController
  before_action { @phone_number = PhoneNumber.find_by(id: params[:id]) }

  def new
  end

  def update
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
