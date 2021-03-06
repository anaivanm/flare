class Message < ApplicationRecord
  after_create :broadcast_message

  belongs_to :user
  belongs_to :chat
  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end

   def broadcast_message
    ActionCable.server.broadcast("chat_#{chat.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "shared/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: self.user.id
    })
  end
end
