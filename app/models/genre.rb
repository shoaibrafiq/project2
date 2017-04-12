class Genre < ActiveRecord::Base
has_many :films
#one genre can have many films
end
