class Genre < ActiveRecord::Base
has_many :films
#one genre can have many films

#validation

validates :name, :description, :presence => true
validates :name, :length => { :minimum => 2 }
validates :name, :uniqueness => { :message => "Already Exists" }
end
