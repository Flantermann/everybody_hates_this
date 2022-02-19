class AddReferenceToMilestones < ActiveRecord::Migration[6.1]
  def change
    add_reference :milestones, :mission, foreign_key: true
  end
end
