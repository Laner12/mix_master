require 'rails_helper'

RSpec.feature "User can view created artists" do
  scenario "they see the page for all artists" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artists_path

    expect(page).to have_content artist_name

    click_on artist_name

    expect(current_path).to eq artist_path(artist)
  end
end
# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page
