class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy

  def avatar_url
    if is_helper .nil?
    "http://placecage.com/40/40"
    else
    "https://www.imdb.com/name/nm0331516/mediaviewer/rm618450688"
    end
  end

  def is_helper?
    true
  end
end
