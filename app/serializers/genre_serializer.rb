class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  # When a request is made, the backend will check here FIRST! That's why you have to add the has_many

  has_many :movies
end
