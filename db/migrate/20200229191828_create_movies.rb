class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :genre_id
      t.string :title
      t.string :rating
      t.string :description

      t.timestamps
    end
  end
end
