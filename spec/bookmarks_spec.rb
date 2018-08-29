require 'bookmarks'

describe Bookmarks do

  # describe the test subject with a double for the PG class

  # describe .all
  # it connects to a database named 'bookmark_manager_test'
  # it passes method 'exec' to the PG object
  # it
  it '.all returns a list of bookmarks' do
    p ENV['RACK_ENV']
    bookmarks = Bookmarks.all
    expect(bookmarks).to match_array(["http://destroyallsoftware.com",
      "http://www.google.com", "http://www.makersacademy.com"])
  end

end
