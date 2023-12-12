user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [
  {
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
  }
]

user2_apartments = [
  {
    street: "456 B Street",
    unit: "500",
    city: "Los Angeles",
    state: "California",
    square_footage: 2000,
    price: 6500,
    bedrooms: 2,
    bathrooms: 2,
    pets: "Dogs ok",
    image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  }
]

user1_apartments.each do |apartment| 
    user1.apartments.create(apartment)
    p "created: #{apartment}"
  end
  
  user2_apartments.each do |apartment| 
    user2.apartments.create(apartment)
    p "created: #{apartment}"
  end