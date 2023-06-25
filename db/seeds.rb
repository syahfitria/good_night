# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create some users
user1 = User.create(name: "Ann")
user2 = User.create(name: "Rick")
user3 = User.create(name: "Maria")

# Create some sleep records for the users
user1.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 4.hours.ago, duration: 2.hours.ago - 4.hours.ago)
user1.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 6.hours.ago, duration: 1.hours.ago - 6.hours.ago)
user2.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 3.hours.ago, duration: 1.hours.ago - 3.hours.ago)
user3.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 9.hours.ago, duration: 6.hours.ago - 9.hours.ago)