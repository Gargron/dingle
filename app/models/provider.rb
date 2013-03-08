class Provider < ActiveRecord::Base
  attr_accessible :country, :name
  belongs_to :country
  has_many :ratings, :dependent => :destroy

  validates :name, :presence => true
  validates :country_id, :presence => true

  def update_scores
    self.overall     = self.ratings.average(:overall)
    self.privacy     = self.ratings.average(:privacy)
    self.support     = self.ratings.average(:support)
    self.stability   = self.ratings.average(:stability)
    self.price_value = self.ratings.average(:price_value)
    self.score       = generate_sorting_score
    self.save
  end

  private

  def generate_sorting_score
    n    = self.ratings.count
    pos  = self.ratings.where("overall > 6").count
    conf = 0.95

    if n == 0
      return 0
    end

    z    = Statistics2.pnormaldist(1 - (1 - conf) / 2)
    phat = 1.0 * pos / n

    (phat + z * z / (2 * n) - z * Math.sqrt((phat * (1 - phat) + z * z / (4 * n)) / n))/(1 + z * z / n)
  end
end
