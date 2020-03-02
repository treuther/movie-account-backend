class Movie < ApplicationRecord
    
    belongs_to :genre

    # accepts_nested_attributes_for :genre #allows user to create a genre while creating a new movie

    validates :title, :rating, :description, presence: true
    validates_inclusion_of :rating, :in => ['R', 'PG-13', 'PG']

    # if movie title already exists, cannot save again.

    # def check_dupes(movie)
    #     if self.title !== movie.title
    #         self.save
    #     else
    #         return 'movie title already exists'
    #     end
    # end
    
end
