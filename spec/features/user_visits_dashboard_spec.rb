RSpec.describe "User visits Dashboard", js: true do
  let(:user) { create(:user) }

  before do
    create_list(:link, 5, user: user)
    sign_in(user, scope: :user)
  end

  scenario "successfully" do
    visit root_path

    expect(page).to have_content("Dashboard")
    expect(page).to have_css(".list-group-item", count: 5)
  end
end
