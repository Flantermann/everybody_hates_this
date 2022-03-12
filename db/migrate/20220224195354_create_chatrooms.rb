class CreateChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.boolean :is_private, :default => false
      t.belongs_to :sender_one, foreign_key: { to_table: :users }
      t.belongs_to :sender_two, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
