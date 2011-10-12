class School < ActiveRecord::Base
  has_many :locations, :as => :organization
  has_many :deal_school_eligibilities
  has_many :available_deals, :through => :deal_school_eligibilities, :source => :deal
  has_one :user
end
