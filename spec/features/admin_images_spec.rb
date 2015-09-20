require 'rails_helper'

feature 'logged in admin sees images index' do
  scenario 'with valid attributes' do

    admin = User.create(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_images_path
    expect(page).to have_content("All Images")
  end
end

feature 'default user does not see admin images index' do
  scenario 'with invalid attributes' do

  user = User.create(username: "default_user", password: "password", role: 0)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit admin_images_path

  expect(page).to_not have_content("All Images")
  expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end

feature 'logged in admin can create images' do
  scenario 'with valid attributes' do

    admin = User.create(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path
    fill_in "Title", with: "Organization"
    fill_in "Url", with: "http://static1.squarespace.com/static/52f8cf0be4b0430a990c060b/52fd097be4b0da63ce88126e/52fd097ce4b01593fa51582b/1392314750612/small-home-organization-1200x900.jpg?format=750w"
    click_on "Create Image"

    expect(page).to have_content("Organization")
  end

  feature 'default_user_cannot_create_images' do
    scenario 'with valid attributes' do

      user = User.create(username: "user", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_image_path
      expect(page).to have_content("404")
    end
  end

  feature "logged in admin can edit an image" do
    scenario "with valid attributes" do

      admin = User.create(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path
      fill_in "Title", with: "Organization"
      fill_in "Url", with: "http://static1.squarespace.com/static/52f8cf0be4b0430a990c060b/52fd097be4b0da63ce88126e/52fd097ce4b01593fa51582b/1392314750612/small-home-organization-1200x900.jpg?format=750w"
      click_on "Create Image"

      expect(page).to have_content("Organization")

      click_on "Edit"
      fill_in "Title", with: "Updated"
      fill_in "Url", with: "http://static1.squarespace.com/static/52f8cf0be4b0430a990c060b/52fd09f0e4b061d88c5eefe6/52fd09f1e4b003139ba86867/1392314868613/home-office-organization-ideas-321.jpg?format=750w"
      click_on "Edit Image"

      expect(page).to have_content("Updated")
      expect(page).to_not have_content("Organization")
    end
  end

  feature "logged in admin can delete an image" do
    scenario "with valid attributes" do

      admin = User.create(username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path
      fill_in "Title", with: "Organization"
      fill_in "Url", with: "http://static1.squarespace.com/static/52f8cf0be4b0430a990c060b/52fd097be4b0da63ce88126e/52fd097ce4b01593fa51582b/1392314750612/small-home-organization-1200x900.jpg?format=750w"
      click_on "Create Image"

      expect(page).to have_content("Organization")

      click_on "Destroy"

      expect(current_path).to eq(admin_images_path)
      expect(page).to_not have_content("Organization")
    end
  end
end