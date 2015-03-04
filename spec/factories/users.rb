require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email 'testuser@asu.edu'
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.graduation 'Spring 2017'
    f.shirt_size 'M'
    f.gender 'F'
    f.password 'testpassword'
  end
end
