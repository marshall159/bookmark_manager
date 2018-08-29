require 'pg'

class Bookmarks

  def self.all
    conn = PG.connect( dbname: 'bookmark_manager')
    conn.exec( "SELECT * FROM bookmarks" ).map { |bookmark| bookmark["url"] }
  end

end
