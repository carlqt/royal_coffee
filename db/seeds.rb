# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times { CustomerTable.create }

if Rails.env.development?
  Product.create([
    {name: "Green Tea", drink_type: 1, venti_price: 8, grande_price: 6, tall_price: 3},
    {name: "Latte", drink_type: 0, grande_price: 6, tall_price: 3},
    {name: "Cappuccino", drink_type: 0, grande_price: 6},
    {name: "Earl Grey", drink_type: 1, venti_price: 12, grande_price: 7, tall_price: 5.40},
    ])
end