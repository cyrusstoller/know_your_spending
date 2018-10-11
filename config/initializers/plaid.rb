::PlaidClient = Plaid::Client.new(env: ENV['PLAID_ENV'].to_sym || :sandbox,
                           client_id: ENV['PLAID_CLIENT_ID'],
                           secret: ENV['PLAID_SECRET'],
                           public_key: ENV['PLAID_PUBLIC_KEY'])
