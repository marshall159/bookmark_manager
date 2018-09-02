require 'bookmarks'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all
      bookmark = bookmarks.first

      expect(bookmarks.length).to eq(3)
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq('Destroy all software')
      expect(bookmark.url).to eq('http://destroyallsoftware.com')
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the list of bookmarks' do
      bookmark = Bookmark.create(url: "http://football365.com", title: "Football rocks")
      bookmark = Bookmark.all.last.title
      expect(bookmark).to eq("Football rocks")
      # expect(bookmarks).not_to include("http://football365.com")
    end

    it 'does not create a new bookmark if the URL is not valid' do
      bookmark = Bookmark.create(url: 'not a real bookmark', title: 'this either')
      expect(bookmark).not_to be_a Bookmark
    end
  end
end
