require 'net/http'
class TopStoriesController < ApplicationController
	def index
		unless cookies[:client_cookie] == ""
			@image_ext = ["jpg","jpeg","gif","png","tif","bmp"]
			if params[:before]
				before_key = params[:before]
				uri = URI ("http://www.reddit.com/top.json?limit=15&before=t3_#{before_key}")
			elsif params[:after]
				after_key = params[:after]
				uri = URI("http://www.reddit.com/top.json?limit=15&after=#{after_key}")
			else
				uri = URI('http://www.reddit.com/top.json?limit=15')
			end
			@response = JSON.parse(Net::HTTP.get(uri))
			@res = Hashie::Mash.new @response
			@stories = @res.data.children
		else
			redirect_to root_path, :alert => "Please log in"
		end
	end
end


