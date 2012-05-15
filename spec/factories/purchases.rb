# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    purchaser_name "John Smith"
    item_description "This is a description"
    item_price "9.99"
    purchase_count 1
    merchant_address "123 Main St"
    merchant_name "Test Inc"
  end
end
