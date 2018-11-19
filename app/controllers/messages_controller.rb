class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save # false
      redirect_to @message
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
