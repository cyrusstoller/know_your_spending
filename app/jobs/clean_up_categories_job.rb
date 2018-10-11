class CleanUpCategoriesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    
    puts "Removing any selected categories if the user has no transactions for #{user.email}"
    c = []

    user.categories.each do |category|
      if user.transactions.in_category(category).count != 0
        c << category
      end
    end

    user.categories = c

    puts "Finished cleaning category selections for #{user.email}"
  end
end
