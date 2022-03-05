class AddUserIdToContracts < ActiveRecord::Migration[6.1]
  def change
    change_table(:contracts) do |t|
      t.references :asker, foreign_key: { to_table: 'users' }
      t.references :receiver, foreign_key: { to_table: 'users' }
      t.belongs_to :asker, foreign_key: { to_table: :users }
      t.belongs_to :receiver, foreign_key: { to_table: :users }
    end
  end
end
