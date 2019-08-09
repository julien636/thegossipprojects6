# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# Creation de 10 villes
10.times do
  City.create(name:Faker::Address.city, zipcode:Faker::Address.zip_code)
end
  # Creation de 10 utilisateurs
10.times do
  User.create(city_id:City.find(1) ,first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, description:Faker::Lorem.sentence, email:Faker::Internet.email, age:rand(10..100),password:Faker::Name.last_name)
end
# On crée une boucle pour "peupler" chaque ville
i=1
while i!=11 
  User.find(i).update(city:City.find(1))
  i=i+1
end
  # Creation de 10 potins
10.times do
  Gossip.create(title:Faker::Lorem.word, content:Faker::Lorem.sentence,user:User.find(rand(1..10)))
end

# Creation de 10 tags
10.times do
  Tag.create(title:Faker::Lorem.word)
end
  # Creation de association tag gossip
10.times do
  TableJoinTagGossip.create(gossip:Gossip.find(rand(1..10)), tag:Tag.find(rand(1..10)))
end
  # Creation de 10 private message
10.times do
  PrivateMessage.create(content:Faker::Lorem.sentence, sender:User.find(rand(1..10)), recipient:User.find(rand(1..10)))
end
  # Creation de 10 comment de gossip
10.times do
  Comment.create(content:Faker::Lorem.sentence, user:User.find(rand(1..10)), commentable:Gossip.find(rand(1..9)))

end
  # Creation de 20 Like 
20.times do
  i=1
  i=rand(1..2)
  if i==1
    Like.create(user:User.find(rand(1..10)), gossip:Gossip.find(rand(1..9)))
  else 
    Like.create(user:User.find(rand(1..10)), comment:Comment.find(rand(1..10)))
  end
end

 # Creation de 10 comment de gossip ou comment
10.times do
  i=1
  i=rand(1..2)
  if i==1
    Comment.create(content:Faker::Lorem.sentence, user:User.find(rand(1..10)), commentable:Comment.find(rand(1..10)))
  else 
    Comment.create(content:Faker::Lorem.sentence, user:User.find(rand(1..10)), commentable:Gossip.find(rand(1..9)))
  end
end
  

