class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.string :plaid_account_id
      t.string :category
      t.string :plaid_category_id
      t.string :transaction_type
      t.decimal :amount
      t.date :date_of_transaction
      t.boolean :pending
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.decimal :location_lat
      t.decimal :location_lon
      t.integer :user_id

      t.timestamps
    end

    add_index :transactions, :user_id
    add_index :transactions, :plaid_category_id
    add_index :transactions, :date_of_transaction
  end
end
