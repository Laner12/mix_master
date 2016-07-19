require 'rails_helper'

RSpec.feature "User can edit an existing artist" do
  scenario "they see the page for the updated artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)

    expect(page).to have_content artist_name

    click_on "Edit"
    fill_in "artist_name", with: "Rob Marley"
    fill_in "artist_image_path", with: artist_image_path
    click_button "Update Artist"

    expect(page).to have_content "Rob Marley"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
