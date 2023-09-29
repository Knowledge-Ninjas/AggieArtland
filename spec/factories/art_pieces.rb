require 'faker'

FactoryBot.define do
    factory :art_piece do
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        address { Faker::Address.full_address }
        artist { Faker::Artist.name }
    end
end