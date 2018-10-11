class AddNameToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :name, :string
  end
end
