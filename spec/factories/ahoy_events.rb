FactoryBot.define do
  factory "Ahoy::Event" do
    visit { create(:"Ahoy::Visit") }
    user
    link
    name { "Open slug" }
    properties { {link_id: link.id} }
  end
end
