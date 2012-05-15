# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    description "Item Description"
    price "9.99"
    merchant
  end
end
