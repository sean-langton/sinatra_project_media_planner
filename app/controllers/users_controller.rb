class UsersController < ApplicationController

  get "/" do
    erb :index
  end
  
  get "/signup" do
    if Helpers.is_logged_in?(session)
      erb :'users/plan_index'
    else
      erb :'users/sign_up'
    end
  end

  post "/signup" do
    @user = User.create(params)
    session[:user_id] = @user.id
    if session[:user_id]
      redirect to "/#{@user.slug}/index"
    else
      redirect to "/signup"
    end
  end

  get "/login" do
    if Helpers.is_logged_in?(session)
      erb :'users/plan_index'
    else
      erb :'users/login'
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      binding.pry
      redirect to "/#{@user.slug}/index"
    else
      redirect to "/"
    end
  end

  get "/:user_slug/index" do
    if params[:user_slug] == Helpers.current_user(session).slug
      erb :'users/user_index'
    else
      redirect to "/"
    end
  end

  get "/logout" do
    session.clear
    redirect to "/"
  end

end
