class DashboardsController < ApplicationController
  def index
    @user = current_user
    @open_chats = Chat.where(helper: nil).where.not(helpee: nil)
  end

  def get_open_chats
    # render partial: 'open_chats_list', locals: {chats: @open_chats}
    @open_chats = Chat.where(helper: nil).where.not(helpee: nil)
    respond_to do |format|
      format.js  # <-- idem
    end
  end
end
