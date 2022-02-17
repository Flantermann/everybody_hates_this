class RemoveDeadlineFromIssues < ActiveRecord::Migration[6.1]
  def change
    remove_column :issues, :deadline
  end
end
