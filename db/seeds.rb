require 'faker'
puts 'Destroying data... 🗑'
User.destroy_all
Message.destroy_all
5.times do 
  User.create(
    username: Faker::Internet.username(specifier: 5..8),
    password: 'helloworld'
  )
end

for i in 1..5
  Message.create(
    body: Faker::Quote.yoda,
    user: User.all.sample
  )
end  

puts '5 user/messages instances created! Your data is ready 🍪'
