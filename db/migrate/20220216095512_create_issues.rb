class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.integer :category
      t.integer :timeframe
      t.integer :prefered_buddy_age
      t.integer :prefered_buddy_gender
      t.string :prefered_buddy_location
      t.date :deadline
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
