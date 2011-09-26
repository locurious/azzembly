# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
      name "MyString"
      description "MyText"
      deal_type "MyString"
      start_date "2011-09-25 22:09:52"
      end_date "2011-09-25 22:09:52"
      business_id 1
    end
end