RSpec.describe "User shows link", js: true do
  let(:user) { create(:user) }
  let(:link) { create(:link, user: user, url: "https://www.google.com/") }
  let!(:event) { create_list("Ahoy::Event", 5, user: nil, link: link) }

  before { sign_in(user, scope: :user) }

  scenario "successfully" do
    visit link_path(link)

    expect(page).to have_css("table.table tr", count: 6)
  end
end
