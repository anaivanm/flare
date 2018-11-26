class DashboardsController < ApplicationController
  def index
    @user = current_user
    @open_chats = Chat.where(helper: nil).where.not(helpee: nil)
  end
end
