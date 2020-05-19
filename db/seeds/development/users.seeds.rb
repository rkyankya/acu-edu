require_relative 'helper'

after 'development:schools' do
  puts 'Seeding users'

  # Add admin user to all schools.
  School.all.each do |school|
    school.users.where(email: 'admin@acu.com').first_or_create!(name: Faker::Name.name, title: 'School Admin', password: 'foobar')
  end

  # Add three student users in the first school.
  school = School.first

  (1..3).each do |index|
    school.users.create!(email: "student#{index}@student.acu.com", name: Faker::Name.name, title: 'Student', password: 'foobar')
  end

  # Add two users to be coaches in first school.
  (1..2).each do |index|
    school.users.create!(
      email: "coach#{index}@acu.com",
      name: Faker::Name.name,
      title: Faker::Job.title
    )
  end
end

