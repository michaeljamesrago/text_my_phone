class PhoneNumbersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @phone_number = current_user.phone_numbers.build(phone_number_params)
    if @phone_number.save
      flash[:success] = "New number saved. Please verify."
      redirect_to current_user
    else
      render 'phone_numbers/new', status: :unprocessable_entity
    end
  end

  private

    def phone_number_params
      params.require(:phone_number).permit(:number)
    end
end
