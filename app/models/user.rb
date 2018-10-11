class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :user_to_categories, dependent: :destroy
  has_many :categories, through: :user_to_categories, source: :category

  has_many :transactions

  def has_transactions?
    transactions.count > 0
  end

  def rand_category
    res = categories.sample(1).first
    if res.nil?
      Category.sample(1).first
    else
      res
    end
  end

  def rand_month(category)
    months = transactions.positive.in_category(category).
      select("date_trunc('month', date_of_transaction) as month").group(:month).to_a.map(&:month)
    months.sample(1).first || Date.today
  end
end
