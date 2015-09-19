require "rails_helper"

feature "registered user can log out" do
  scenario "with valid attributes" do

    user = User.create(username: "MB", password: "secret")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "secret"
    click_button "Login"

    within(".header") do
      expect(page).to have_content("MB's Ideas")
    end

    click_link "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("MB's Ideas")
  end
end