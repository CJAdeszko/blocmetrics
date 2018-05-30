# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Create sample Users
User.create!(
  email: "cjadeszko@gmail.com",
  password: "password",
  confirmed_at: Time.now.utc, # skip confirmation
)

User.create!(
  email: "test@Blocmetrics.com",
  password: "password",
  confirmed_at: Time.now.utc, # skip confirmation
)
users = User.all


#Create sample RegisteredApplications
RegisteredApplication.create!(
  user: users.sample,
  name: "Test Application",
  url: "www.testapplication.com"
)

RegisteredApplication.create!(
  user: users.sample,
  name: "Test Application 2",
  url: "www.testapplication2.com"
)
registered_applications = RegisteredApplication.all


#Create sample Events
100.times do
  Event.create!(
    name: Faker::Events.name,
    registered_application: registered_applications.sample
  )
end

puts "#{User.count} users created."
puts "#{RegisteredApplication.count} registered applications created."
puts "#{Event.count} events created."
