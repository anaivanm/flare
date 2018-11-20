class Message < ApplicationRecord
  after_create :broadcast_message

  belongs_to :user
  belongs_to :chat
  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end
end
