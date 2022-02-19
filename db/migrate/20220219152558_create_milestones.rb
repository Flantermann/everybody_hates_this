class CreateMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :milestones do |t|
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
