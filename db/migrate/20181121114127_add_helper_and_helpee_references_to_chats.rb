class AddHelperAndHelpeeReferencesToChats < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :helpee
    add_reference :chats, :helper
  end
end
