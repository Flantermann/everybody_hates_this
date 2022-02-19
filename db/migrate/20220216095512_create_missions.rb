class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.integer :category
      t.integer :timeframe
      t.integer :prefered_buddy_age_start
      t.integer :prefered_buddy_age_end
      t.string :prefered_buddy_location
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
