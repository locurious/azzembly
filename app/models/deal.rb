class Deal < ActiveRecord::Base
  belongs_to :business
  validates_presence_of :name

  has_many :deal_school_eligibilities
  has_many :eligible_schools, :through => :deal_school_eligibilities
end
