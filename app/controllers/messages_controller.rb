class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def new
  end
end
