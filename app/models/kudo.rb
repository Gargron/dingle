class Kudo < ActiveRecord::Base
  attr_accessible :rating_id, :user_id
  belongs_to :user
  belongs_to :rating
end
