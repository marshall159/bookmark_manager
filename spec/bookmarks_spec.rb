require 'bookmarks'

describe Bookmarks do

  it '.all returns a list of bookmarks' do
    expect(Bookmarks.all).to match_array(['User Stories: An Agile Introduction',
    'Writing user stories', 'Feature tests'])
  end

end
