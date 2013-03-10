class ProviderSuggestion < ActiveRecord::Base
  attr_accessible :country_id, :country, :name

  belongs_to :country

  validates :country_id, :presence => true
  validates :name, :presence => true, :uniqueness => { :scope => :country_id, :case_sensitive => false }

  scope :waiting, includes(:country).where(:accepted => false)

  def accept
    Provider.create(country: self.country, name: self.name)

    self.accepted = true
    self.save
  end
end
