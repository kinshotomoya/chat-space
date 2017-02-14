# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_group do
    user_id            {Faker::Number.number(2)}
    group_id           {Faker::Number.number(2)}
  end
end
