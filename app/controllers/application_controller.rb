require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "87827cb2ab34ec45aff97fb396dcfe34e6be4a2564c8047ffacd3fa8e519f0cf19a277feefc59a45c02594ac51d83362c1921a38168575ea8fb65c3d8485a232"
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

end
