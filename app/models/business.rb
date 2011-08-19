class Business < ActiveRecord::Base
  #has_many :locations, :dependent => :destroy
              
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :created_before, lambda { |ago|
    where("businesses.created_at < ?", ago)
  }
end
