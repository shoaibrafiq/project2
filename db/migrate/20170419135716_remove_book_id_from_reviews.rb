class RemoveBookIdFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :book_id, :integer
  end
end
