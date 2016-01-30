FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Delicious Drink #{n}" }
    venti_price 10
    grande_price 7
    tall_price 6
    drink_type 0
  end
end

