class ChatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
    if current_user.is_helper?
      @chat.helper = current_user
      @chat.save
    end
  end

  def create
    if current_user.nil?
      @helpee = User.create(email: "#{User.last.id + 1}@gmail.com", password: "123456", is_helper: false, username: params[:username])
      sign_in(@helpee, scope: :user)
    end
    @chat = Chat.create(helpee: current_user)
    redirect_to chat_path(@chat)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to root_path
  end
end

