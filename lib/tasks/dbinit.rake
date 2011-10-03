require 'awesome_print'

namespace :db do
  desc "Initialize the database, currently fills with fake data for development"
  task :init => :environment do

    [User,
     Business,
     Deal,
     School,
     DealSchoolEligibility,
     Location
    ].each { |k| k.destroy_all }

    ap User.create(
      :email                 => "foo@bar.baz",
      :password              => 'foobar',
      :password_confirmation => "foobar",
      :type                  => 'BusinessUser'
      )
    puts "Password is foobar"

    %w(Biscuit Hotdog Satellite).each do |noun|
      Business.create(
        :name => "The #{noun} Store"
      )
    end

    d = Deal.create(
      :business_id => Business.first.id,
      :start_date  => Time.now - 1.year,
      :end_date    => Time.now + 7.days,
      :deal_type   => "dollar_off",
      :name        => "My Dummy Deal",
      :description => "This is a description of my dummy deal. It's a swell deal, really."
    )


    %w(Zucchini Walrus Upside-Down Twisted).each do |school|
      k = %w(Prep High Academy College)[rand(4)]
      School.create( :name => "#{school} #{k}" )
    end

    DealSchoolEligibility.create(
      :school_id => School.first.id,
      :deal_id => d.id
    )

    b = Business.first
    b.locations.create(
      :name        => "My Dummy Business Headquarters",
      :address     => "4895 Santa Cruz Avenue",
      :city        => "San Diego",
      :region      => "California",
      :postal_code => "92107"
    )

    b.save!

  end
end
