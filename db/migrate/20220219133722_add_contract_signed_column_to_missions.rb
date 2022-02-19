class AddContractSignedColumnToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :contract_signed?, :boolean, null: false, default: false
  end
end
