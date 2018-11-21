class Chat < ApplicationRecord
  has_many :messages
  belongs_to :helpee, class_name: "User"
  belongs_to :helper, class_name: "User", optional: true
end
