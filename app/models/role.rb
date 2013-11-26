class Role < ActiveRecord::Base
has_many :users  
attr_accessible :description, :name
  validates_presence_of :name
  validates_uniqueness_of :name
end
