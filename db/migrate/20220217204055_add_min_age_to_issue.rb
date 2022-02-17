class AddMinAgeToIssue < ActiveRecord::Migration[6.1]
  def change
    remove_column :issues, :prefered_buddy_age
    remove_column :issues, :prefered_buddy_gender
    add_column :issues, :prefered_buddy_age_start, :integer
    add_column :issues, :prefered_buddy_age_end, :integer
  end
end
