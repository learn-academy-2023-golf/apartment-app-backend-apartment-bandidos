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
        image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
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
  describe "POST /create" do
    it "creates an apartment" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params

      apartment = Apartment.first
      expect(response).to have_http_status(200)
      expect(apartment.street).to eq("123 A Street")
      expect(apartment.unit).to eq("1")
      expect(apartment.city).to eq("Los Cabos")
      expect(apartment.state).to eq("CA")
      expect(apartment.square_footage).to eq(3000)
      expect(apartment.price).to eq("1900")
      expect(apartment.bedrooms).to eq(3)
      expect(apartment.bathrooms).to eq(4)
      expect(apartment.pets).to eq("spiders only")
      expect(apartment.image).to eq("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
      expect(apartment.user_id).to eq(user.id)
    end
    it "doesn't create an apartment without a street" do
      apartment_params = {
        apartment: {
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }}

        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['street']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a unit" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['unit']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a city" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['city']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a state" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['state']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a square_footage" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['square_footage']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a price" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['price']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a bedroom" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bathrooms: 4,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['bedrooms']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a bathrooms" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          pets: "spiders only",
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['bathrooms']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a pet" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['pets']).to include "can't be blank" 
    end
    it "doesn't create an apartment without a image" do
      apartment_params = {
        apartment: {
          street: "123 A Street",
          unit: "1",
          city: "Los Cabos",
          state: "CA",
          square_footage: 3000,
          price: 1900,
          bedrooms: 3,
          bathrooms: 4,
          pets: "spiders only",
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['image']).to include "can't be blank" 
    end
  end
  describe "PATCH /update" do
    it "updates an apartment" do
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
        image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        
      apartment_params = {
        apartment: {
          street: "123 B Street",
          unit: "2",
          city: "Dos Cabos",
          state: "CB",
          square_footage: 2500,
          price: 2000,
          bedrooms: 2,
          bathrooms: 3,
          pets: "no spiders",
          image: "TEST",
          user_id: user.id
        }
      }
      patch "/apartments/#{apartment.id}", params: apartment_params
      apartment.reload
      expect(response.status).to eq 200
      expect(apartment.street).to eq "123 B Street"
      expect(apartment.unit).to eq "2"
      expect(apartment.city).to eq "Dos Cabos"
      expect(apartment.state).to eq "CB"
      expect(apartment.square_footage).to eq 2500
      expect(apartment.price).to eq "2000"
      expect(apartment.bedrooms).to eq 2
      expect(apartment.bathrooms).to eq 3
      expect(apartment.pets).to eq "no spiders"
      expect(apartment.image).to eq "TEST"
    end
    it "doesn't update an apartment without valid parameters" do
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
        image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
        
      apartment_params = {
        apartment: {
          street: "",
          unit: "",
          city: "",
          state: "",
          square_footage: nil,
          price: nil,
          bedrooms: nil,
          bathrooms: nil,
          pets: "",
          image: "",
          user_id: user.id
        }
      }
      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response.status).to eq 422
    end
  end
end
