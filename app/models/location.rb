class Location < ActiveRecord::Base
  belongs_to :business
  belongs_to :school, :foreign_key => 'organization_id'
end
