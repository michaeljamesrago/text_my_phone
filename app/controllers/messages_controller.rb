class MessagesController < ApplicationController
  before_action :authorized_user
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @phone_number = @user.phone_numbers.find(params[:phone_number_id])
    @message = @phone_number.messages.build
  end

  def create
    @user = User.find(params[:user_id])
    @phone_number = @user.phone_numbers.find(params[:phone_number_id])
    @message = @phone_number.messages.build(message_params)
    if @message.save
      @phone_number.send_sms(params[:message][:body])
      flash[:success] = "New message created."
      redirect_to user_phone_number_path(@user, @phone_number)
    else
      render 'new', status: :unprocessable_entity
    end

  end

  private

    def message_params
      params.require(:message)
      .permit(:body)
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
