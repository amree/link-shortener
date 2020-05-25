FactoryBot.define do
  factory :link do
    user

    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    slug { SecureRandom.alphanumeric(5).downcase }
  end
end
