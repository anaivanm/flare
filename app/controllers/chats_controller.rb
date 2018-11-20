class ChatsController < ApplicationController
  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
  end
end
