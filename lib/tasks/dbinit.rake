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

    business_user = User.create(
      :email                 => "business@foo.bar",
      :password              => 'foobar',
      :password_confirmation => "foobar",
      :type                  => 'BusinessUser',
      :name                  => 'Foo Business User'
      )

    puts "Password for all sample accounts is 'foobar'"
    puts business_user.email

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


    %w(Zucchini Walrus Upside-Down Twisted).each_with_index do |school,i|
      k = %w(Prep High Academy College)[rand(4)]
      school = School.create( :name => "#{school} #{k}" )
      school_user = User.create(
        :email                 => "school#{i}@foo.bar",
        :password              => 'foobar',
        :password_confirmation => 'foobar',
        :type                  => 'SchoolUser',
        :name                  => "Foo School User #{i}"
        )
      school_user.organization = school
      school_user.save!
      puts school_user.email
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

    school_locations = [
      {
        :name        => "Del Mar Pines School",
        :address     => "3975 Torrington Street",
        :city        => "San Diego",
        :region      => "CA",
        :postal_code => "92130-1293",
      },
      {
        :name        => "Sage Canyon Elementary School",
        :address     => "5290 Harvest Run Drive",
        :city        => "San Diego",
        :region      => "CA",
        :postal_code => "92130",
      },
      {
        :name        => "Torrey Pines High School",
        :address     => "3710 Del Mar Heights Road",
        :city        => "San Diego",
        :region      => "CA",
        :postal_code => "92130",
      },
      {
        :name        => "Carmel Del Mar School",
        :address     => "12345 Carmel Park Drive",
        :city        => "San Diego",
        :region      => "CA",
        :postal_code => "92130",
      },
    ]

    School.all.each_with_index{|s, i|
      s.locations.create( school_locations[i] )
    }

  end
end
