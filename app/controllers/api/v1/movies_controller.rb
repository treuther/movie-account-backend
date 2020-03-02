class Api::V1::MoviesController < ApplicationController

    def index
        @movies = Movie.all
        render json: @movies
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

    private

    def movie_params
        params.require(:movie).permit(:genre_id, :title, :rating, :description)
    end

end
