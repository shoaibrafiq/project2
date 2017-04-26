class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user

#validation
  validates :rating, :comment, :presence => true
  validates :comment, :length => { :minimum => 3 }
end
