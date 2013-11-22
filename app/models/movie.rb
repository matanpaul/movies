class Movie < ActiveRecord::Base
	default_scope order('year_released DESC')

	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query " , :query => "%#{query}%", :query_plain => "#{query}")
	end
end
