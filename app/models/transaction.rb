class Transaction < ApplicationRecord
  validates_uniqueness_of :transaction_id

  scope :in_category, -> (category) {
    wild_carded = category.plaid_id.gsub("X","%")
    where("plaid_category_id like ?", wild_carded)
  }

  scope :by_month, -> (year, month) {
    start_date = Date.new(year, month)
    end_date = start_date + 1.month
    where(date_of_transaction: start_date...end_date)
  }

  scope :positive, -> { where("amount > 0") }

  scope :chron, -> { order(date_of_transaction: :asc) }
end
