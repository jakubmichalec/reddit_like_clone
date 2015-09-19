FactoryGirl.define do
  factory :user do
    sequence(:name) { FFaker::Name.name }
    sequence(:email) { FFaker::Internet.email }
    password 'password'
  end
end
