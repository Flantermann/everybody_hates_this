class AddDefaultToStatusInMilestones < ActiveRecord::Migration[6.1]
  def change
    remove_column :milestones, :status
    add_column :milestones, :status, :integer, default: 0
  end
end
