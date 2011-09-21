class Location < ActiveRecord::Base
  belongs_to :business
  belongs_to :school, :foreign_key => 'organization_id'

  geocoded_by :geocodeable_address_string
  after_validation :geocode

  def geocodeable_address_string
    <<-ends
    #{address}, \
    #{city}, \
    #{region}\
    #{postal_code}\
    ends
  end

end
