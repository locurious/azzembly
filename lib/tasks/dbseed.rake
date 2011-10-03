require 'awesome_print'

namespace :db do
  desc "Initialize the database, currently fills with fake data for development"
  task :init => :environment do

    ap User.create(
      :email                 => "foo@bar.baz",
      :password              => 'foobar',
      :password_confirmation => "foobar",
      :type                  => 'BusinessUser'
      )

    ap(b = Business.create(
      :name => "My Dummy Business"
    ))

    ap(d = Deal.create(
      :business_id => b.id,
      :start_date => Time.now - 1.year,
      :end_date => Time.now + 7.days,
      :deal_type => "dollar_off",
      :name => "My Dummy Deal",
      :description => "This is a description of my dummy deal. It's a swell deal, really."
    ))

    ap(s = School.create(
      :name => "My Dummy School",
    ))

    ap(DealSchoolEligibility.create(
      :school_id => s.id,
      :deal_id => d.id
    ))

    ap(b.locations.create(
      :name => "My Dummy Business Headquarters",
      :address => "4895 Santa Cruz Avenue",
      :city => "San Diego",
      :region => "California",
      :postal_code => "92107"
    ))

    b.save!

  end
end
