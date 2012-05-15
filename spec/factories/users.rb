# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    login "MyString"
    provider "MyString"
    uid "MyString"
    name "MyString"
  end
end
