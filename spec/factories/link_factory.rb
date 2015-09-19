FactoryGirl.define do
  factory :link do
    sequence(:title) { FFaker::Lorem.words(3) }
    sequence(:url) { FFaker::Internet.http_url }
    sequence(:content) { FFaker::Lorem.paragraph }
    user_id 1
  end
end
