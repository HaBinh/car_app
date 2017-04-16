#USERS
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             mod:     true,
             activated: true,
             activated_at: Time.zone.now)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

#VEHICLES
50.times do |n|
  isCar = Faker::Boolean.boolean(true_ratio = 0.8)
  brand = Faker::Vehicle.manufacture
  model = Faker::Number.between(1995,2016)
  if isCar
    price = Faker::Number.between(5,15)*100000
  else
    price = Faker::Number.between(8,15)*10000
  end
  if isCar
    seat = Faker::Number.between(4,20)
  else
    seat = 2
  end
  about = Faker::Lorem.paragraphs(2)
  Vehicle.create!(isCar: isCar,
                  brand: brand,
                  model: model,
                  price: price,
                  seat: seat,
                  about: about)
end
