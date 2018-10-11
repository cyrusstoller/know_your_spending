class GameController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def question
    @category1, @date1, @transactions1, @total1 = gen_side(current_user)
    @category2, @date2, @transactions2, @total2 = gen_side(current_user)

    if @total1 > @total2
      @correct = -1
    elsif @total1 == @total2
      @correct = 0
    else
      @correct = 1
    end
  end

  private

  def gen_side(user)
    category = user.rand_category
    date = user.rand_month(category)
    transactions = user.transactions.in_category(category).by_month(date.year, date.month).positive.chron
    total = transactions.sum(:amount)

    return category, date, transactions, total
  end
end
