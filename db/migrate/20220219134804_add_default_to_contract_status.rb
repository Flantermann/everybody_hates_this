class AddDefaultToContractStatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :status
    add_column :contracts, :status, default: "pending"
  end
end
