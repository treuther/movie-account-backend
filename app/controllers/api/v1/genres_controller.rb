class Api::V1::GenresController < ApplicationController

    def index
        genres = Genre.all
        render json: genres
    end

    def create
        genre = Genre.new(genre_params)
        if genre.save
            render json: genre
        else
            render json: {error: 'Error creating genre. Try again.'}
        end
    end

    def show
        genre = Genre.find(params[:id])
        render json: genre
    end

    def update
        genre = Genre.find(params[:id])
        genre.update(genre_params)
        render json: genre #or does this need to be new(genre) Change once discovered?
    end

    def destroy
        binding.pry
        # genre = Genre.find(params["id"])
        # genre.detroy
        # render json: genres
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end

end
