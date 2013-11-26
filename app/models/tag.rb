class Tag < ActiveRecord::Base
belongs_to :tales
   attr_accessible :name
end
