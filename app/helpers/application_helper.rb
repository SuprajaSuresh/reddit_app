module ApplicationHelper
	def formatted_time(time)
		Time.at(time).strftime("%d %B %Y, %H:%M %p")
	end
end