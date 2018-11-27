class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :helpee, class_name: "User", optional: true
  belongs_to :helper, class_name: "User", optional: true
end
