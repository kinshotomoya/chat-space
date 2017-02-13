# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat do
    text           "hello"
    user_id        '1'
    group_id       '60'
    image          ""
  end
end
