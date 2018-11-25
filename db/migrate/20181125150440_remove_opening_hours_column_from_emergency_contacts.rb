class RemoveOpeningHoursColumnFromEmergencyContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :emergency_contacts, :opening_hours
  end
end
