class ChatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
  end

  def create

    if current_user.nil?
      helpee = User.create(email: "anonymous@gmail.com", password: "123456", is_helper: false)
      sign_in(helpee, scope: :user)
    end
    @chat = Chat.create(helpee: current_user)
    redirect_to chat_path(@chat)
  end
end
