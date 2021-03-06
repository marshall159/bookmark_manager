require 'pg'
require 'uri'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    connect_database
    @conn.exec( "SELECT * FROM bookmarks" ).map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  # initialize with hash:
  # def initialize(name,age,occupation,hobby,birthplace)
  # @name = 53
  # @age = etc
  # @occupation =
  # @hobby =
  # @birthplace =
  # instead passing a hash removes necessity of passing arguments in exact order
  # also if we forget to pass in a value it will default to nil, not throw error
  # def initialize( name, details = {} ) # give default empty hash if not provided
  # so that no error thrown
  # defaults = {age: 25, occupation: 'coder', hobby: 'coding', birthplace: 'Earth'}
  # merge details to override defaults if provided:
  # defaults.merge!(details)
  # @name = name
  # @age = defaults[:age]
  # @occupation = defaults[:occupation]
  # @hobby = defaults[:hobby]
  # @birthplace = defaults[:birthplace]

  # then pass in hash
  # info = {age: 53, occupation: 'banker', hobby: 'fishing', birthplace: 'London'}
  # Object.new('Aneel', info)
  # or can pass in hash directly:
  # Object.new('Aneel', {age: 53, hobby: 'fishing', birthplace: 'London'})
  # can also omit curly braces:
  # Object.new('Aneel', age: 53, hobby: 'fishing', birthplace: 'London')

  # title:

  def self.create(url:, title:)
    return false unless valid_url?(url)
    connect_database
    result = @conn.exec( "INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;" )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
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
