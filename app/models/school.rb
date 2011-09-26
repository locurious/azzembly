class School < ActiveRecord::Base
  has_many :locations, :as => :organization
end
