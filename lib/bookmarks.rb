require 'pg'

class Bookmarks

  def self.all
    if ENV['RACK_ENV'] == 'test'
      database = 'bookmark_manager_test'
    else
      database = 'bookmark_manager'
    end
    
    conn = PG.connect( dbname: database)
    conn.exec( "SELECT * FROM bookmarks" ).map { |bookmark| bookmark["url"] }
  end

end
