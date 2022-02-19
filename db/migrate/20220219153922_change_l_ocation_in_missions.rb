class ChangeLOcationInMissions < ActiveRecord::Migration[6.1]
  def change
    remove_column :missions, :prefered_buddy_location
    add_column :missions, :prefered_buddy_location, :integer
  end
end
