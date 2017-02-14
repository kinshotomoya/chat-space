# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat do
    text           {Faker::Lorem.paragraph}
    user_id        {Faker::Number.number(1)}
    group_id       {Faker::Number.number(2)}
    image          {Faker::Avatar.image}
  end
end
