feature 'Bookmarks features' do

  scenario 'homepage displays welcome message' do
    visit('/')
    expect(page).to have_content('Welcome')
  end

  scenario 'bookmarks route displays a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("http://destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.makersacademy.com")
  end

end
