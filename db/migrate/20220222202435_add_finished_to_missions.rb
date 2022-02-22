class AddFinishedToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :finished?, :boolean, null: false, default: false
  end
end
