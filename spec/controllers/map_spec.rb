require 'rails_helper'

RSpec.describe MapController, type: :controller do
    
    describe 'map location ruby' do
        it 'sets the latitude' do
            post :updateloc, params: { latitude: "30.6214878", longitude: "-96.3403293", accuracy: "12" }
            expect(session[:latitude]).to eq("30.6214878")
        end

        it 'sets the longitude' do
            post :updateloc, params: { latitude: "30.6214878", longitude: "-96.3403293", accuracy: "12" }
            expect(session[:longitude]).to eq("-96.3403293")
        end

        it 'calculates the distance properly' do
            art_piece = FactoryBot.create(:art_piece, address:"125 Spence St, College Station, TX 77843")
            expect(art_piece.distance_to_pretty(30.6190725, -96.3389643)).to eq("0.19 miles (989 ft)")
        end
    end

end