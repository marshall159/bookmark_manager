require 'pg'

class Bookmarks

  def self.all
    connect_database
    @conn.exec( "SELECT * FROM bookmarks" ).map { |bookmark| bookmark["url"] }
  end

  def self.create(url)
    connect_database
    @conn.exec( "INSERT INTO bookmarks(url) 
                VALUES ('#{url}');" )
  end

  def self.connect_database
    if ENV['ENVIRONMENT'] == 'test'
      database = 'bookmark_manager_test'
    else
      database = 'bookmark_manager'
    end
    @conn = PG.connect( dbname: database)
  end

end
