# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_image_url
  id = (1..66).to_a.sample
  gender = ["men", "women"].sample
  "http://api.randomuser.me/portraits/#{gender}/#{id}.jpg"
end

User.destroy_all
Message.destroy_all
Follower.destroy_all

50.times do |user|
  User.create! username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               name: Faker::Name.name,
               password: "12345678",
               password_confirmation: "12345678",
               photo_url: random_image_url



end

messages = []

User.all.each do |user|

  (10..50).to_a.sample.times do
    messages << user.messages.build(body: Faker::Company.bs, created_at: (0..72).to_a.sample.hours.ago)
    messages << user.messages.build(body: Faker::Hacker.say_something_smart, created_at: (0..72).to_a.sample.hours.ago)
  end

end

messages.shuffle.each(&:save)

jwo = User.create! username: "jwo", email: "jwo@example.com", name: "Jesse Wolgamott", password: "examples", password_confirmation: "examples"
User.all.shuffle.take(5).each do |user|
  jwo.follow!(user)
end
