require "rails_helper"

feature "User creates an idea" do
  scenario "with valid attributes" do
    visit new_idea_path

    fill_in "Title", with: "Bike Room"
    fill_in "Description", with: "Build a workshop space"
    click_on "Create Idea"

    expect(page).to have_content("Bike Room")
  end

  feature "User edits an idea" do
    scenario "with valid attributes" do
      visit new_idea_path

      fill_in "Title", with: "Bike Room"
      fill_in "Description", with: "Build a workshop space"
      click_on "Create Idea"

      expect(page).to have_content("Bike Room")

      click_on "Edit"
      fill_in "Title", with: "Updated"
      fill_in "Description", with: "Edited"
      click_on "Edit Idea"

      expect(page).to have_content("Updated")
      expect(page).to have_content("Edited")
      expect(page).to_not have_content("Bike Room")

    end
  end

  feature "User deletes an idea" do
    scenario "with valid attributes" do
      visit new_idea_path

      fill_in "Title", with: "Bike Room"
      fill_in "Description", with: "Build a workshop space"
      click_on "Create Idea"

      expect(page).to have_content("Bike Room")

      click_on "Destroy"

      expect(page).to_not have_content("Bike Room")
    end
  end

end