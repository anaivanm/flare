class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :helper_chats, class_name: "Chat", foreign_key: "helper_id", dependent: :destroy
  has_many :helpee_chats, class_name: "Chat", foreign_key: "helpee_id", dependent: :destroy
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def avatar_url
    if is_helper?
    "http://placecage.com/40/40"
    else
    "https://images.unsplash.com/photo-1482424917728-d82d29662023?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3111583f370fe6f427ba4b67f2aef7d8&auto=format&fit=crop&w=40&q=40"
    end
  end

  def is_helper?
    is_helper
  end
end
