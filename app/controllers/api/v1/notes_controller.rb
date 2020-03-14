class Api::V1::NotesController < ApplicationController

    before_action :set_movie # before any action takes place, run this method.

    #notes belong to a movie. Go through movies to get to notes.
    def index
        notes = @movie.notess
        render json: notes
    end

    def create
        note = @movie.notes.new(note_params)
        if note.save
            render json: @movie
        else
            render json: {error: 'Movie must include note.'}
        end
    end

    def show
        Note = Note.find(params[:id])
        render json: note
    end

    def update
        
    end

    def destroy
        note = Note.find(params["id"])
        movie = Movie.find(note.movie_id)
        note.destroy
        render json: movie

    end

    def set_movie
        @movie = Movie.find(params[:movie_id])
    end

    private

    def note_params
        params.require(:note).permit(:movie_id, :content)
    end

end