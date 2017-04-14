class Genre < ActiveRecord::Base
  belongs_to :user
has_many :films
#one genre can have many films
end
