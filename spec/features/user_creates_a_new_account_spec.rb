require "rails_helper"

feature 'user creates a new account' do
  scenario 'with valid attributes' do

    visit root_path
    expect(current_path).to eq("/")
    click_link "Create a New Account"
    expect(current_path).to eq(new_user_path)
    fill_in "Username", with: "MB"
    fill_in "Password", with: "secret"
    click_button "Create Account"

    within(".header") do
      expect(page).to have_content("MB's Ideas")
    end
  end
end