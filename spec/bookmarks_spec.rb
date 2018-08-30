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
  end

end
