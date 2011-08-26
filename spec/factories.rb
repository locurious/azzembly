require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :admin do |u|
  u.name 'Test Admin'
  u.email 'admin@test.com'
  u.password 'password'
end
