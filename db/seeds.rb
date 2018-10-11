# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [["Food and Drink",         "13XXXXXX"],
              ["Bar",                    "13001XXX"],
              ["Night Life",             "13004XXX"],
              ["Restaurants",            "13005XXX"],
              ["Healthcare",             "14XXXXXX"],
              ["Recreation",             "17XXXXXX"],
              ["Arts and Entertainment", "17001XXX"],
              ["Services",               "18XXXXXX"],
              ["Automotive Services",    "18006XXX"],
              ["Shopping",               "19XXXXXX"],
              ["Tax Refund",             "20001000"],
              ["Travel",                 "22XXXXXX"],
              ["Airports",               "22002XXX"],
              ["Gas Stations",           "22009XXX"],
              ["Lodging",                "22012XXX"],
              ["Taxi",                   "22016XXX"],
              ["Tolls",                  "22017XXX"]]

Category.destroy_all

categories.each do |name, id|
  Category.create(name: name, plaid_id: id)
end