class Film < ActiveRecord::Base
belongs_to :user
# A film  belongs to a user
belongs_to :genre
# One film belongs to one genre
end
