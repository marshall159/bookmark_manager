require 'pg'

class Bookmarks

  def self.all
    if ENV['RACK_ENV'] == 'test'
      database = 'bookmark_manager_test'
    else
      database = 'bookmark_manager'
    end
<<<<<<< HEAD

=======
>>>>>>> f145ff865d47c0f981ab04b5763adf862ccfa9ca
    conn = PG.connect( dbname: database)
    conn.exec( "SELECT * FROM bookmarks" ).map { |bookmark| bookmark["url"] }
  end

end
