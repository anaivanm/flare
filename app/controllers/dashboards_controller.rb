require "pry-byebug"

class DashboardsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:get_open_chats]

  def index
    @user = current_user
    @open_chats = Chat.where(helper: nil).where.not(helpee: nil)
  end

  def get_open_chats
    @open_chats = Chat.where(helper: nil).where.not(helpee: nil)
    respond_to do |format|
      format.js  # <-- idem
    end
  end

  def update
    @user = User.find(params[:user_id])
    @user.update(address: "Ahornsgade 21, 2200")

    redirect_to emergency_contacts_path
  end
end
