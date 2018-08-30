require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  before('/bookmarks') { @bookmarks = Bookmarks.all }

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmarks.create(params[:new_bookmark])
    erb :bookmarks
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
