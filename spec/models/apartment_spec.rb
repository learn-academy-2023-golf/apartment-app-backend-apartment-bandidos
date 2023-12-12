require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) {User.create(
    email: "test1@example.com",
    password: "password",
    password_confirmation: "password"
  )}

  it 'should validate street is not blank' do 
    apartment = user.apartments.create(
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      price: 1900,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate unit is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      price: 1900,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it 'should validate city is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      state: "CA",
      square_footage: 3000,
      price: 1900,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end

  it 'should validate state is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      square_footage: 3000,
      price: 1900,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end

  it 'should validate square_footage is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      price: 1900,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end

  it 'should validate price is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it 'should validate bedrooms is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      price: 3000,
      bathrooms: 4,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end

  it 'should validate bathrooms is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      price: 3000,
      bedrooms: 3,
      pets: "spiders only",
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end

  it 'should validate pets is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      price: 3000,
      bedrooms: 3,
      bathrooms: 4,
      image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end

  it 'should validate image is not blank' do 
    apartment = user.apartments.create(
      street: "123 A Street",
      unit: "1",
      city: "Los Cabos",
      state: "CA",
      square_footage: 3000,
      price: 3000,
      bedrooms: 3,
      bathrooms: 4,
      pets: "spiders only"
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end
end