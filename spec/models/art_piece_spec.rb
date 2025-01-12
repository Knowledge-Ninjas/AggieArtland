require 'rails_helper'

RSpec.describe ArtPiece, type: :model do
    describe "validations" do
      it "is valid with valid attributes" do
        art_piece = FactoryBot.build(:art_piece)
        expect(art_piece).to be_valid
      end
  
      it "is not valid without a name" do
        art_piece = FactoryBot.build(:art_piece, name: nil)
        expect(art_piece).not_to be_valid
        expect(art_piece.errors[:name]).to include("can't be blank")
      end
  
      it "is not valid without an address" do
        art_piece = FactoryBot.build(:art_piece, address: nil)
        expect(art_piece).not_to be_valid
        expect(art_piece.errors[:address]).to include("can't be blank")
      end
    end

    describe "callbacks" do
        context "after_validation" do
          let(:art_piece) { FactoryBot.build(:art_piece) }
          let(:geocoder_result) { double('geocoder_result') }

          it "executes geocoding after validation" do
            allow(Geocoder).to receive(:search).and_return([geocoder_result])
            allow(geocoder_result).to receive(:coordinates).and_return([42.123, -71.456])
            allow(geocoder_result).to receive(:latitude).and_return(42.123)
            allow(geocoder_result).to receive(:longitude).and_return(-71.456)

            art_piece.valid?

            expect(art_piece.latitude).to_not be_nil
            expect(art_piece.longitude).to_not be_nil
        end
      end
    end
end
  