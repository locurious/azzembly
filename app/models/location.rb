class Location < ActiveRecord::Base
  belongs_to :business
  belongs_to :school, :foreign_key => 'organization_id'

  geocoded_by :geocodeable_address_string, :latitude=>:lat, :longitude=>:lng
  after_validation :geocode

  def geocodeable_address_string
    "#{address}, #{city}, #{region} #{postal_code}"
  end

end
