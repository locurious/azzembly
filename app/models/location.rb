class Location < ActiveRecord::Base
  belongs_to :organization, :polymorphic => true

  geocoded_by :geocodeable_address_string, :latitude=>:lat, :longitude=>:lng
  after_validation :geocode

	scope :schools,    :conditions => {:organization_type => 'School'}
	scope :businesses, :conditions => {:organization_type => 'Business'}

  def geocodeable_address_string
    "#{address}, #{city}, #{region} #{postal_code}"
  end

end
