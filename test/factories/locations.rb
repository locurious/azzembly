# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
      name "MyString"
      address "MyString"
      city "MyString"
      region "MyString"
      postal_code "MyString"
      phone "MyString"
      fax "MyString"
      lat 1.5
      lng 1.5
    end
end