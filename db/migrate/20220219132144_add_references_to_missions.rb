class AddReferencesToMissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :missions, :contract, foreign_key: true
  end
end
