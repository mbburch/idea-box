require 'rails_helper'

feature 'logged in admin sees categories index' do
  scenario 'with valid attributes' do

    admin = User.create(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    expect(page).to have_content("All Categories")
  end
end

feature 'default user does not see admin categories index' do
  scenario 'with invalid attributes' do

  user = User.create(username: "default_user", password: "password", role: 0)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit admin_categories_path

  expect(page).to_not have_content("All Categories")
  expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end

feature 'logged in admin can create categories' do
  scenario 'with valid attributes' do

    admin = User.create(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path
    fill_in "Title", with: "Organization"
    click_on "Create Category"

    expect(page).to have_content("Organization")
  end

  feature 'default_user_cannot_create_categories' do
    scenario 'with valid attributes' do

      user = User.create(username: "user", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path
      expect(page).to have_content("404")
    end
  end

  feature "logged in admin can edit a category" do
    scenario "with valid attributes" do

      admin = User.create(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      fill_in "Title", with: "Organization"
      click_on "Create Category"

      expect(page).to have_content("Organization")

      click_on "Edit"
      fill_in "Title", with: "Updated"
      click_on "Edit Category"

      expect(page).to have_content("Updated")
      expect(page).to_not have_content("Organization")
    end
  end

  feature "logged in admin can delete a category" do
    scenario "with valid attributes" do

      admin = User.create(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      fill_in "Title", with: "Organization"
      click_on "Create Category"

      expect(page).to have_content("Organization")

      click_on "Destroy"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to_not have_content("Organization")
    end
  end
end