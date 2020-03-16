class Api::V1::MoviesController < ApplicationController

    before_action :set_genre # before any action takes place, run this method.

    #movies belong to a genre. Go through genres to get to movies.
    def index
        movies = @genre.movies
        render json: movies
    end

    # def index #good to nest to show all reviews for 1 product, based on URL path
    #     #how to check if nested
    #     if @product = Product.find_by_id(params[:product_id])
    #     #nested
    #         @reviews = @product.reviews
    #     else
    #     #not nested
    #         @reviews = Review.all
    #     end
    # end

    def create
        movie = @genre.movies.new(movie_params)
        if movie.save
            render json: @genre
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
        render json: genre

    end

    def set_genre
        @genre = Genre.find(params[:genre_id])
    end

    private

    def movie_params
        params.require(:movie).permit(:genre_id, :title, :rating, :description)
    end

end
