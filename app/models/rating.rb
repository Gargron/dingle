class Rating < ActiveRecord::Base
  attr_accessible :provider, :provider_id, :user, :review, :price_value, :privacy, :stability, :support, :review_attributes

  belongs_to :provider
  belongs_to :user
  has_one :review, :dependent => :destroy
  has_many :kudos, :dependent => :destroy

  accepts_nested_attributes_for :review, :allow_destroy => true

  validates :price_value, :numericality => { :only_integer => true, :less_than => 11 }, :presence => true
  validates :privacy, :numericality => { :only_integer => true, :less_than => 11 }, :presence => true
  validates :stability, :numericality => { :only_integer => true, :less_than => 11 }, :presence => true
  validates :support, :numericality => { :only_integer => true, :less_than => 11 }, :presence => true
  validates :provider_id, :uniqueness => { :score => :user_id }
  validates :review, :presence => true

  scope :best, order("overall DESC")
  scope :worst, order("overall ASC")

  before_save :calculate_overall
  after_save :update_provider_scores

  private

  def update_provider_scores
    self.provider.update_scores
  end

  def calculate_overall
    self.overall = 0.9 * self.privacy + 1.0 * self.stability + 0.5 * self.support + 0.7 * self.price_value
  end
end
