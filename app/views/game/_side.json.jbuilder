json.category_name category.name
json.date date.strftime("%B %Y")
json.total sprintf("%0.2f", total)
json.transaction_count transactions.length
json.transactions transactions do |t|
  json.name t.name
  json.amount sprintf("%0.2f", t.amount)
  json.id t.transaction_id
  json.date t.date_of_transaction
end