class Movie < ApplicationRecord
    
    belongs_to :genre

    validates :title, :rating, :description, presence: true
    validates_inclusion_of :rating, :in => ['R', 'PG-13', 'PG']
    
end
