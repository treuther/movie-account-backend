class MovieSerializer < ActiveModel::Serializer
  attributes :id, :genre_id, :title, :rating, :description

end

# genre_id is not needed because the movie route is nested with genre.
# if this changes, then genre_id will be needed here.
