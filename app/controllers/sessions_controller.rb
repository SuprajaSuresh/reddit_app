require "ruby_reddit_api"
class SessionsController < ApplicationController
  def new
  end
 
  def create
  	if Reddit::Api.new '#{params[:username]}', '#{params[:password]}'
	   	redirect_to '/top_stories'
	  else 
	    redirect_to :back
	  end
  end

  def destroy
  	Reddit::Base.instance_variable_set("@cookie",nil)
  	redirect_to root_path
  end
end