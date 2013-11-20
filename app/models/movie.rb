class Movie < ActiveRecord::Base
	default_scope order('year_released DESC')

	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query OR year_released LIKE :query" , :query => "%#{query}%")
	end
end
