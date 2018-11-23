class AddLatestChatIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :latest_chat_id, :integer
  end
end
