require 'pg'

def truncate_test_database
  conn = PG.connect( dbname: 'bookmark_manager_test')
  conn.exec( "TRUNCATE bookmarks" )
end

def setup_test_database
  conn = PG.connect( dbname: 'bookmark_manager_test')
  conn.exec( "INSERT INTO bookmarks (url, title)
              VALUES ('http://destroyallsoftware.com', 'Destroy all software'),
                      ('http://www.google.com', 'Google homepage'),
                      ('https://makers.tech', 'Makers rocks') " )
end
