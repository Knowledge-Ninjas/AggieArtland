require 'faker'

FactoryBot.define do
    factory :badge do
        sequence(:id) { |n| n } 
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        badge_type { "stamps" }
        requirement { Faker::Number.digit.to_s }
    end
end