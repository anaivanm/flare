class AddOpeningAndClosingColumnsToEmergencyContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :emergency_contacts, :opening, :integer
    add_column :emergency_contacts, :closing, :integer
  end
end
