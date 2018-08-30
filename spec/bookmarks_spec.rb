require 'bookmarks'

describe Bookmarks do
  it '.all returns a list of bookmarks' do
    bookmarks = Bookmarks.all
    expect(bookmarks).to match_array(["http://destroyallsoftware.com",
      "http://www.google.com", "http://www.makersacademy.com"])
  end

end
