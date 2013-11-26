class Genre < ActiveRecord::Base

has_many :tales
  attr_accessible :description, :genre_name
validates_presence_of :genre_name
end
