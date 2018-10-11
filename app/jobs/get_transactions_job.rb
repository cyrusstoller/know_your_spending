class GetTransactionsJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    if user.plaid_access_token
      call_plaid(user)
    else
      puts "#{user.email} doesn't have an access_token yet"
    end
  end

  def call_plaid(user)
    access_token = user.plaid_access_token
    puts "Starting to pull transactions for #{user.email}"

    # While loop to get all of the transactions for that user

    end_date = Date.today.strftime("%Y-%m-%d")
    start_date = (Date.today - 365 * 2).strftime("%Y-%m-%d")

    transaction_response = PlaidClient.transactions.get(access_token, start_date, end_date)

    # get the transactions
    transactions = transaction_response['transactions']
    while transactions.length < transaction_response['total_transactions']
      transaction_response = PlaidClient.transactions.get(access_token,
                                                     start_date,
                                                     end_date,
                                                     offset: transactions.length)
      transactions += transaction_response['transactions']
    end

    # create the transactions
    transactions.each do |t|
      Transaction.new({
        "transaction_id": t["transaction_id"],
        "plaid_account_id": t["account_id"],
        "category": (t["category"].join(", ") rescue nil),
        "plaid_category_id": t["category_id"],
        "transaction_type": t["transaction_type"],
        "amount": t["amount"],
        "date_of_transaction": t["date"],
        "pending": t["pending"],
        "location_address": t["location"]["address"],
        "location_city": t["location"]["city"],
        "location_state": t["location"]["state"],
        "location_zip": t["location"]["zip"],
        "location_lat": t["location"]["lat"],
        "location_lon": t["location"]["lon"],
        "user_id": user.id,
        "name": t["name"]
      }).save
    end

    puts "Finished pulling transactions for #{user.email}"

    CleanUpCategoriesJob.perform_later(user.id)
  end
end
