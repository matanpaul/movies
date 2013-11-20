class MoviesController < ApplicationController
	def index
		@movies = Movie.search_for(params[:q])
	end

	def new
	end
	
end
