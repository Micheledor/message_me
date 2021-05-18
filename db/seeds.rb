require 'faker'
puts 'Destroying data... 🗑'
5.times do 
  User.create(
    username: Faker::Internet.username(specifier: 5..8),
    password: 'helloworld'
  )
end
puts '5 user instances created! Your data is ready 🍪'
