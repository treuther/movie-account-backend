class NoteSerializer < ActiveModel::Serializer
  attributes :id, :movie_id, :content
end
