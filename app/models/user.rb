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
      "profile_pic.png"
    else
    "https://image.shutterstock.com/image-vector/red-profile-icon-on-white-450w-421687531.jpg"
    end
  end

  def is_helper?
    is_helper
  end
end
