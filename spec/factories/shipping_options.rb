# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shipping_option do |s|
    name "test"
    price 50
    s.association :product  
  end
end
