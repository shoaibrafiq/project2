class AddAttachmentFilmImgToFilms < ActiveRecord::Migration
  def self.up
    change_table :films do |t|
      t.attachment :film_img
    end
  end

  def self.down
    remove_attachment :films, :film_img
  end
end
