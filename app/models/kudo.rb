class Kudo < ActiveRecord::Base
  attr_accessible :rating_id, :user_id
  
  belongs_to :user
  belongs_to :rating

  validates :user_id, :uniqueness => { :scope => :rating_id }

  after_create :update_rating_kudos

  private

  def update_rating_kudos
    self.rating.update_kudos
  end
end
