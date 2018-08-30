require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    p ENV['RACK_ENV']
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
