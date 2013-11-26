class Tale < ActiveRecord::Base
acts_as_taggable 
belongs_to :genre  
belongs_to :user
has_many :comment

attr_accessible :body_text, :genres, :source, :status, :submission_date, :title, :tag_list
validates_presence_of :title, :body_text, :source

end
