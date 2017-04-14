class AddDescriptionToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :description, :string
  end
end
