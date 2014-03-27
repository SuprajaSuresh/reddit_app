require 'net/http'
class TopStoriesController < ApplicationController
	def index
		unless cookies[:client_cookie] == ""
			@image_ext = ["jpg","gif","png","tif","bmp"]
			uri = URI('http://www.reddit.com/top.json?limit=45')
			@response = JSON.parse(Net::HTTP.get(uri))
			@results = @response["data"]["children"]
			@stories = @results.paginate(:page => params[:page], :per_page => 15)
		else
			redirect_to root_path, :alert => "Please log in"
		end
	end
end
