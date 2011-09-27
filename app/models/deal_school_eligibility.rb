class DealSchoolEligibility < ActiveRecord::Base
  belongs_to :deal
  belongs_to :school
end
