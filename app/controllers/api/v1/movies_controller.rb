class Api::V1::MoviesController < ApplicationController

    before_action :set_genre # before any action takes place, run this method.

    #movies belong to a genre. Go through genres to get to movies.
    def index
        movies = @genre.movies
        render json: movies
    end

    def create
        movie = @genre.movies.new(movie_params)
        if @genre.check_dupes(movie) != 'Movie title already exists.'
            movie.save
            render json: movie
        else
            render json: {error: 'Movie title already exists.'}
        end
    end

    def show
        movie = Movie.find(params[:id])
        render json: movie
    end

    def update
        
    end

    def destroy

    end

    def set_genre
        @genre = Genre.find(params[:genre_id])
    end

    private

    def movie_params
        params.require(:movie).permit(:genre_id, :title, :rating, :description)
    end

end
