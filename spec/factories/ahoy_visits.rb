FactoryBot.define do
  factory "Ahoy::Visit" do
    ip { Faker::Internet.public_ip_v4_address }
    referrer { Faker::Internet.public_ip_v4_address }
  end
end
