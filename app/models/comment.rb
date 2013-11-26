class Comment < ActiveRecord::Base
 belongs_to :tale
 belongs_to :user 
attr_accessible :comment_body, :submission_date
validates_presence_of :comment_body
end
