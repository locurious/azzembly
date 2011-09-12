class Business < ActiveRecord::Base
  has_many :users
  has_many :locations, :foreign_key => 'organization_id'
  
end
