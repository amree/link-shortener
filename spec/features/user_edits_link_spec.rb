RSpec.describe "User edits link", js: true do
  let(:user) { create(:user) }
  let(:link) { create(:link, user: user) }

  before { sign_in(user, scope: :user) }

  scenario "successfully" do
    visit edit_link_path(link)

    fill_in "link[title]", with: "Reddit"
    fill_in "link[url]", with: "https://www.reddit.com/"
    fill_in "link[slug]", with: "reddit"

    click_button "Submit"

    expect(page).to have_current_path(link_path(link))
  end
end
