class School < ActiveRecord::Base
  #has_many :locations, :dependent => :destroy
              
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :created_before, lambda { |ago|
    where("schools.created_at < ?", ago)
  }
end
