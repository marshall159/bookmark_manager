# if we require pg
# we can insert data into our bookmark_manager_test database from
# inside an it block

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

  scenario 'add a new bookmark' do
    visit('/bookmarks')
    fill_in(:new_bookmark, with: 'http://football365.com')
    click_button('Submit')
    expect(page).to have_content('http://football365.com')
  end

  scenario 'add an incorrect URL' do
    visit('/bookmarks')
    fill_in(:new_bookmark, with: 'football365')
    click_button('Submit')
    expect(page).to have_content('Invalid Bookmark')
    expect(page).not_to have_content('football365')
  end

end
