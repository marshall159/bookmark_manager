feature 'Bookmarks features' do

  scenario 'homepage displays welcome message' do
    visit('/')
    expect(page).to have_content('Welcome')
  end

  scenario 'bookmarks route displays a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('User Stories: An Agile Introduction')
    expect(page).to have_content('Writing user stories')
    expect(page).to have_content('Feature tests')
  end

end
