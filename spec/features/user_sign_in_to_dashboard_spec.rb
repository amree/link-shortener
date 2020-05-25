RSpec.describe "User sign in to Dashboard", js: true do
  let(:user) { create(:user) }

  scenario "successfully" do
    visit root_path

    expect(page).to have_content("Login to your account")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password

    click_button "Sign in"

    expect(page).to have_content("Try adding new URL")
  end
end
