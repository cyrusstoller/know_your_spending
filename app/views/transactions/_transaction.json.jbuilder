json.extract! transaction, :id, :transaction_id, :plaid_account_id, :category, :plaid_category_id, :transaction_type, :amount, :date_of_transaction, :pending, :location_address, :location_city, :location_state, :location_zip, :location_lat, :location_lon, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
