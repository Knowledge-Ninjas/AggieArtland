class ArtPiece < ApplicationRecord
    validates_presence_of :name, :address
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
end
