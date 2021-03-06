class Api::V1::MoviesController < ApplicationController

    # before_action :set_genre # before any action takes place, run this method.
    # movies = @genre.movies

    #movies belong to a genre. Go through genres to get to movies.
    def index
        # movies = @genre.movies
        # render json: movies

        if genre = Genre.find_by_id(params[:genre_id])
            #nested
                movies = genre.movies
            else
            #not nested
                movies = Movie.all
            end
        render json: movies
    end

    def create
         movie = set_genre.movies.new(movie_params)
        if movie.save
            render json: @genre # @genre
        else
            render json: {error: 'Movie already exists.'}
        end
    end

    def show
        movie = Movie.find(params[:id])
        render json: movie
    end

    def update
        
    end

    def destroy
        movie = Movie.find(params["id"])
        genre = Genre.find(movie.genre_id)
        movie.destroy
        render json: @genre

    end

    def set_genre
        @genre = Genre.find(params[:genre_id])
    end

    private

    def movie_params
        params.require(:movie).permit(:genre_id, :title, :rating, :description)
    end

end
