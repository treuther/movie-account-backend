class Api::V1::MoviesController < ApplicationController

    before_action :set_genre # before any action takes place, run this method.

    def index
        movies = @genre.movies
        render json: movies
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            render json: @movie
        else
            render json: {error: 'Error creating movie. Try again.'}
        end
    end

    def show
        @movie = Movie.find(params[:id])
        render json: @movie
    end

    def update
        @movie = Movie.find(params[:id])
        movie.update(movie_params)
        render json: @movie #or does this need to be new(movie)?
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.detroy
        render json: @movies
    end

    def set_genre
        @genre = Genre.find(params[:genre_id])
    end

    private

    def movie_params
        params.require(:movie).permit(:genre_id, :title, :rating, :description)
    end

end
