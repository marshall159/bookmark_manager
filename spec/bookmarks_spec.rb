require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to match_array(["http://destroyallsoftware.com",
        "http://www.google.com", "http://www.makersacademy.com"])
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the list of bookmarks' do
      Bookmarks.create("http://football365.com")
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://football365.com")
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmarks.create('not a real bookmark')
      expect(Bookmarks.all).not_to include 'not a real bookmark'
    end
  end

end
