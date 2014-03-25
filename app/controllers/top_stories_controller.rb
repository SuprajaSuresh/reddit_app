require 'net/http'
class TopStoriesController < ApplicationController
	def index
		unless cookies[:client_cookie] == ""
			@image_ext = ["jpg","gif","png"]
			uri1 = URI("http://www.reddit.com/top.json?limit=15")
			@stories_1 = (JSON.parse(Net::HTTP.get(uri1)))["data"]["children"]
			uri2 = URI("http://www.reddit.com/top.json?limit=15&after=t3_#{@stories_1.last["data"]["id"]}")
			@stories_2 = (JSON.parse(Net::HTTP.get(uri2)))["data"]["children"]
			uri3 = URI("http://www.reddit.com/top.json?limit=15&after=t3_#{@stories_2.last["data"]["id"]}")
			@stories_3 = (JSON.parse(Net::HTTP.get(uri3)))["data"]["children"]
		else
			redirect_to root_path, :alert => "Please log in"
		end
	end
end
