names = %w(daichi kai yoshikawa fake)
names.each do |name|
  User.create!(name: name, email: "#{name}@example.com", password: "password", password_confirmation: "password")
end


users = User.all
last_week = Date.today - 7
50.times do |n|
  content = Faker::Lorem.sentence(5)
  users.each {|user| user.events.create!(content: content, dead: (last_week+n))}
end