RSpec.describe "User visits link", js: true do
  let(:user) { create(:user) }
  let(:link) { create(:link, user: user, url: "https://www.google.com/") }

  scenario "successfully with valid slug" do
    visit "/#{link.slug}"

    expect(current_url).to eql(link.url)
  end
end
