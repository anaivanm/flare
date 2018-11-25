class EmergencyContact < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :opening, presence: true
  validates :closing, presence: true
end
