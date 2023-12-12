require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) {User.create(
    email: "test1@example.com",
    password: "password",
    password_confirmation: "password"
  )}

    describe "GET /index" do
      it "gets a list of apartments" do
        apartment = user.apartments.create(
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        )
        get '/apartments'

        apartment = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(apartment.first['street']).to eq("123 A Street")
        expect(apartment.first['unit']).to eq("1")
        expect(apartment.first['city']).to eq("Los Cabos")
        expect(apartment.first['state']).to eq("CA")
        expect(apartment.first['square_footage']).to eq(3000)
        expect(apartment.first['price']).to eq("1900")
        expect(apartment.first['bedrooms']).to eq(3)
        expect(apartment.first['bathrooms']).to eq(4)
        expect(apartment.first['pets']).to eq("spiders only")
        expect(apartment.first['image']).to eq("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        
    end
  end
end
