RSpec.describe "User creates link", js: true do
  let(:user) { create(:user) }

  before { sign_in(user, scope: :user) }

  scenario "successfully" do
    visit new_link_path

    fill_in "link[title]", with: "CoinGecko"
    fill_in "link[url]", with: "https://www.coingecko.com/"
    fill_in "link[slug]", with: "coingecko"

    click_button "Submit"

    expect(page).to have_current_path(link_path(Link.last))
  end
end
