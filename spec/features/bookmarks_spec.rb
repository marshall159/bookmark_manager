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
    fill_in(:url, with: 'http://football365.com')
    fill_in(:title, with: 'Football news')
    click_button('Submit')
    expect(page).to have_content('Football news')
    expect(page).not_to have_content('http://football365.com')
  end

  # Clicking a link in the list should open the url of the bookmark
  scenario 'clicking a bookmark title displays its url' do
    visit('/bookmarks')
    fill_in(:url, with: 'http://football365.com')
    fill_in(:title, with: 'Football news')
    click_button('Submit')
    click_link('Football news')
    expect(page).to have_content('http://football365.com')
  end

  scenario 'add an incorrect URL' do
    visit('/bookmarks')
    fill_in(:url, with: 'football365')
    fill_in(:title, with: 'Football news')
    click_button('Submit')
    expect(page).to have_content('Invalid Bookmark')
    expect(page).not_to have_content('Football news')
  end

end
