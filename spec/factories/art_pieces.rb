require 'faker'

FactoryBot.define do
    factory :art_piece do
        sequence(:id) { |n| n } 
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        address { "400 Spence St, College Station, TX 77843" }
        artist { Faker::Artist.name }
    end
end