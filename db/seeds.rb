require 'faker'

# You should not have to change or comment out any code in this seed file.
# If your authentication and associations are written correctly, this file will seed correctly.
# If you are having trouble, read your error messages!

# Create Students
30.times do |n|
  User.create!(
    first_name:            Faker::Name.first_name,
    last_name:             Faker::Name.last_name,
    username:              "#{(0...3).map {('a'..'z').to_a[rand(26)]}.join}#{n+100}",
    password:              "12345678"
  )
end

# Create Teams
10.times do
  samples = User.all.sample(11)
  coach = samples.pop
  Team.create!(
    name:         "The #{Faker::Commerce.product_name}s",
    sport:        ["Rugby", "Cricket", "Badminton", "Petanque", "Tiddlywinks", "Ultimate Frisbee"].sample,
    coach:        coach,
    players:      samples
  )
end

# Add a captain to each team
Team.all.each do |team|
  team.playerships.sample.update(captain: true)
end
