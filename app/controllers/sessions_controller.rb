class SessionsController < ApplicationController
  def new
  end
 
  def create
		client = RedditKit::Client.new "#{params[:session][:username]}", "#{params[:session][:password]}"
		if client.signed_in?
			redirect_to '/top_stories', :notice => "Login successful"
		else
			redirect_to :back, :alert => "Please try again"
		end
  end

  def destroy
  	client.sign_out
  	redirect_to root_path, :notice => "Successfully Logged out"
  end
end