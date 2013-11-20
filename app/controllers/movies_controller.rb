class MoviesController < ApplicationController
	def index
		@movies = Movie.search_for(params[:q])
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(safe_movie_params)
		logger.info(@movie.inspect)
		@movie.save
		redirect_to root_path
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update(safe_movie_params)
		@movie.save
		redirect_to root_path
	end

	private

	def safe_movie_params
		return params.require(:movie).permit(:title, :description, :year_released)
	end

end
