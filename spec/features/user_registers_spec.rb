RSpec.describe "User registers", js: true do
  scenario "successfully" do
    visit new_user_registration_path

    expect(page).to have_content("Create new account")

    fill_in "user[email]", with: "gecko@gmail.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_button "Sign up"

    expect(page).to have_content("Try adding new URL")
  end
end
