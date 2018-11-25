class CreateEmergencyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :opening_hours
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
