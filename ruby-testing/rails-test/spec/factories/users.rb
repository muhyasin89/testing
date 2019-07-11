
require 'faker'

FactoryGirl.define do

  factory :user do
    firstname Faker::name
    lastname Faker::name
    username Faker::name
    email Faker::Internet.email
    password "abc"
    password_confirmation "abc"
    salt Faker::Company

    trait :admin do
        admin true
    end

  end
end
