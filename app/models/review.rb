class Review < ActiveRecord::Base
  attr_accessible :content, :rating
  belongs_to :rating
end
