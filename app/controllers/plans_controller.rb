class PlansController < ApplicationController

  get "/plans/new" do
    if Helpers.is_logged_in?(session)
      erb :'plans/create_plan'
    else
      redirect to "/"
    end
  end

  post "/plans" do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
#      @plan = Plan.create(params) unless params[:plan_name].blank? || params[:plan_budget]
      puts params
      redirect to "/#{@user.slug}/index"
    else
      redirect to "/login"
    end
  end

end
