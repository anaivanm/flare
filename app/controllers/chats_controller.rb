class ChatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
    if current_user.is_helper?
      @chat.helper = current_user
      @chat.save
    end
    @transparent = true
  end

  def create
    if current_user.nil?
      @helpee = User.create(email: "#{User.last.id + 1}@gmail.com", password: "123456", is_helper: false, username: params[:username])
      sign_in(@helpee, scope: :user)
    end
    @chat = Chat.create(helpee: current_user)
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCT_SID'], ENV['TWILIO_SECRET_KEY']
    phone_numbers = ['+45 91 99 30 99', '+45 50 37 35 64']
    phone_numbers.each do |number|
    @client.api.account.messages.create(from: '+18042943451', to: number, body: "Hey there. #{current_user.username || 'someone'} wants to talk on Flare.")
    end

    redirect_to chat_path(@chat)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to root_path
  end

  def refresh_chat_banner
    @chat = Chat.includes(messages: :user).find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
