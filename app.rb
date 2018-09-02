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

  before('/bookmarks') { @bookmarks = Bookmark.all }

  get '/bookmarks' do
    erb :bookmarks
  end

  # url: params['url']

  post '/bookmarks' do
    flash[:notice] = 'Invalid Bookmark' unless Bookmark.create(url: params[:url], title: params[:title])
    # erb :bookmarks
    redirect('/bookmarks')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
