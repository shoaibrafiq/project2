class Film < ActiveRecord::Base
belongs_to :user
# A film  belongs to a user
belongs_to :Genre
# One film belongs to one genre
end
