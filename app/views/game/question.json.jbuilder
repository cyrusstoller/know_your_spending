json.correct_answer @correct
json.side1 do
  json.partial! 'game/side', locals: { category: @category1, date: @date1, transactions: @transactions1, total: @total1 }
end
json.side2 do
  json.partial! 'game/side', locals: { category: @category2, date: @date2, transactions: @transactions2, total: @total2 }
end