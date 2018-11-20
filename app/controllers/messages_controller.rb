class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @chat = Chat.find(params[:chat_id])
    @message.chat = @chat
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast("chat_#{@chat.id}", {
        message_partial: render(partial: "messages/message", locals: {message: @message})
        })
    else
      respond_to do |format|
        format.html {
          render "chats/show"
        }
        format.js
      end
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
