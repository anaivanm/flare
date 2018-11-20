class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chat_id]}"
    # stream_from "some_channel"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
