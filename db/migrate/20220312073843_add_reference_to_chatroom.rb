class AddReferenceToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :mission, foreign_key: true
  end
end
