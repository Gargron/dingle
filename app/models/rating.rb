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
  validates :provider_id, :uniqueness => { :scope => :user_id, :message => t('ratings.only_once') }
  validates :review, :presence => true

  scope :best, order("overall DESC, kudos_num DESC").limit(1)
  scope :worst, order("overall ASC, kudos_num DESC").limit(1)

  before_save :calculate_overall
  after_save :update_provider_scores

  def update_kudos
    self.kudos_num = self.kudos.count
    self.save
  end
  
  private

  def update_provider_scores
    self.provider.update_scores
  end

  def calculate_overall
    self.overall = ((0.9 * self.privacy + 1.0 * self.stability + 0.5 * self.support + 0.7 * self.price_value) / 31) * 10
  end
end
