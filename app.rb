require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  before('/bookmarks') { @bookmarks = Bookmarks.all }

  get '/bookmarks' do
    erb :bookmarks
  end

  post '/bookmarks' do
    flash[:notice] = 'Invalid Bookmark' unless Bookmarks.create(params[:new_bookmark])
    # erb :bookmarks
    redirect('/bookmarks')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
