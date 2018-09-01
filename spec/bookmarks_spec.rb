require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to match_array([
        "Destroy all software",
        "Google homepage",
        "Makers rocks"])
      expect(bookmarks).not_to match_array([
        "http://destroyallsoftware.com",
        "http://www.google.com",
        "http://www.makersacademy.com"])
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the list of bookmarks' do
      Bookmarks.create(url: "http://football365.com", title: "Football rocks")
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("Football rocks")
      expect(bookmarks).not_to include("http://football365.com")
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmarks.create(url: 'not a real bookmark', title: 'this either')
      expect(Bookmarks.all).not_to include 'not a real bookmark'
      expect(Bookmarks.all).not_to include 'this either'
    end
  end

end
