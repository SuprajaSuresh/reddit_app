  class SessionsController < ApplicationController

  def new
  end
 
  def create
    uri = URI("http://www.reddit.com/api/login/#{params[:session][:username]}")
    @res = Net::HTTP.post_form(uri, 'user' => "#{params[:session][:username]}", 'passwd' => "#{params[:session][:password]}", 'api_type' => 'json')
    result = JSON.parse(@res.body)
    @response = Hashie::Mash.new @result
    if @response.json.errors.empty?
      cookies[:client_cookie] = @response.json.data.cookie
      redirect_to '/top_stories', :notice => "Login successful"
    else
      redirect_to :back, :alert => "Please try again"
    end
  end

  def destroy
  	cookies[:client_cookie] = nil
  	redirect_to root_path, :notice => "Successfully Logged out"
  end
end