class AddDefaultToContractStatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :status
    add_column :contracts, :status, default: 0
  end
end
