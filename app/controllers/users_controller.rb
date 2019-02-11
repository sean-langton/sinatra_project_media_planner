class UsersController < Sinatra::Base

  configure do
    set :views, 'app/views'
  end

  get "/signup" do
    if Helpers.is_logged_in?(session)
      erb :'users/plan_index'
    else
      erb :'users/sign_up'
    end
  end

  get "/login" do
    if Helpers.is_logged_in?(session)
      erb :'users/plan_index'
    else
      erb :'users/login'
    end
  end

  end
