FactoryGirl.define do

  factory :user do
    name                         {Faker::Name.name}
    email                        {Faker::Internet.email}
    password                     '11111111'
    password_confirmation        '11111111'
  end

end
