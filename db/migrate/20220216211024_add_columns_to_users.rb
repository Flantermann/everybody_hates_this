class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :about_me, :text
  end
end
