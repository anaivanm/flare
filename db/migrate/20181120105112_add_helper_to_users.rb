class AddHelperToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_helper, :boolean
  end
end
