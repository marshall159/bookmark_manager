require 'pg'
require 'uri'

class Bookmarks

  def self.all
    connect_database
    @conn.exec( "SELECT * FROM bookmarks" ).map { |bookmark| bookmark["url"] }
  end

  def self.create(url)
    return false unless valid_url?(url)
    connect_database
    @conn.exec( "INSERT INTO bookmarks(url) VALUES ('#{url}');" )
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
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
