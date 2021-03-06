class PlansController < ApplicationController

  get "/plans/new" do
    if Helpers.is_logged_in?(session)
      erb :'plans/new'
    else
      redirect to "/"
    end
  end

  post "/plans" do
    puts params
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @plan = Plan.create(params[:plan]) unless params[:plan][:plan_name].blank? || params[:plan][:plan_budget].blank?
      @user.plans << @plan
      if params.has_key?("user_ids")
        params[:user_ids].each do |u|
          User.find(u).plans << @plan
        end
      end
      params[:channel].each do |channel|
        if !channel["channel_name"].blank? && !channel["channel_budget"].blank?
            new_channel = Channel.create(channel)
            @plan.channels << new_channel
        end
      end
      redirect to "/#{@user.slug}/index"
    else
      redirect to "/login"
    end
  end

  get "/plans/:plan_id" do
    @plan = Plan.find(params[:plan_id])
    @remaining_budget = @plan.plan_budget - @plan.channels.map {|c| c["channel_budget"]}.reduce(0, :+)
    erb :"plans/show"
  end

  get "/plans/:plan_id/edit" do
    @plan = Plan.find(params[:plan_id])
    if Helpers.is_logged_in?(session) && @plan.users.include?(Helpers.current_user(session))
      erb :"plans/edit"
    else
      redirect to "/"
    end
  end

  patch "/plans/:plan_id" do
    @plan = Plan.find(params[:plan_id])
    if Helpers.is_logged_in?(session) && @plan.users.include?(Helpers.current_user(session))
      @plan.update(params[:plan])
      if params.has_key?("delete_channel")
        params[:delete_channel].keys.each do |id|
          Channel.find(id).delete
        end
      end
      if params.has_key?("user_ids")
        params[:user_ids].each do |u|
          User.find(u).plans << @plan
        end
      end
      if !params[:new_channel][:channel_name].blank? && !params[:new_channel][:channel_budget].blank?
          new_channel = Channel.create(params[:new_channel])
          @plan.channels << new_channel
        end
        redirect to "/plans/#{@plan.id}"
    else
      redirect to "/"
    end
  end

  delete "/plans/:plan_id" do
    @user = Helpers.current_user(session)
    @plan = Plan.find(params[:plan_id])
    if @plan.user_ids.include?(@user.id)
      @plan.delete
      redirect to "#{@user.slug}/index"
    else
    redirect to "/"
    end
  end

end
