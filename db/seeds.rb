# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

belts = ['white_1', 'white_2', 'white_3', 'white_4', 'blue_1', 'blue_2', 'blue_3', 'blue_4', 'purple_1', 'purple_2', 'purple_3', 'purple_4', 'brown_1', 'brown_2', 'brown_3', 'brown_4', 'black_1']

puts 'Deleting all users...'
User.destroy_all if Rails.env == "DEVELOPMENT"

puts 'Creating Admin...'
User.create!(
	email: 'stephen.schuez@gmail.com',
	password: "777jjj",
	admin: true,
	first_name: 'Stephen',
	last_name: 'Schuez',
	date_of_birth: "Wed, 17 Aug, 1988",
	phone: '+41793173399',
	started: "Tue, 4 Feb, 2020",
	weight: 74, 														
	height: 175,																
	weight_good: true, 										
	reasons_for_weight:	Faker::Lorem.sentence(word_count: 5),			
	active_member: true, 								
	not_active_why:	"",							
	belt: belts[0],																	
	last_promotion: "Tue, 20 Aug, 2019", 								
	)

puts 'Creating 50 users...'
50.times do
	user = User.create!(
		email: Faker::Internet.email,
		password: 'aaaaaa',
		admin: false,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		date_of_birth: Faker::Date.birthday(min_age: 16, max_age: 65),
		phone: Faker::PhoneNumber.phone_number_with_country_code,
		started: Faker::Date.between(from: 1000.days.ago, to: Date.today),
		weight: rand(50..100), 														
		height: rand(145..190),																
		weight_good: Faker::Boolean.boolean(true_ratio: 0.7), 										
		reasons_for_weight:	Faker::Lorem.sentence(word_count: 5),			
		active_member: Faker::Boolean.boolean(true_ratio: 0.8), 								
		not_active_why:	Faker::ChuckNorris.fact,							
		belt: belts.sample,																	
		last_promotion: Faker::Date.backward(days: 1000),
		)
end
puts "Created #{User.count} Users."


# SCHEMA:

#  email:																		(string)
#  encrypted_password:											(string)
#  reset_password_token:										(string)
#  reset_password_sent_at: 									(datetime)
#  remember_created_at:											(datetime)
#  created_at: 															(datetime)
#  updated_at:															(datetime)
#  admin: 																	(boolean)
#  first_name: 															(string)
#  last_name:																(string)
#  date_of_birth:														(date)	
#  phone:																		(string)
#  started:																	(date)
#  weight:  																(integer)
#  height:																	(integer)
#  weight_good: 														(boolean)
#  reasons_for_weight:											(string)
#  active_member: 													(boolean)
#  not_active_why:													(string)
#  belt:																		(string)
#  last_promotion:													(date)	




