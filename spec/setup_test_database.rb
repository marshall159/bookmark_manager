require 'pg'

def truncate_test_database
  conn = PG.connect( dbname: 'bookmark_manager_test')
  conn.exec( "TRUNCATE bookmarks" )
end

def setup_test_database
  conn = PG.connect( dbname: 'bookmark_manager_test')
  conn.exec( "INSERT INTO bookmarks (url)
              VALUES ('http://destroyallsoftware.com'),
                      ('http://www.google.com'),
                      ('http://www.makersacademy.com') " )
end
