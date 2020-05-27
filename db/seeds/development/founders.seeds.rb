require_relative 'helper'

after 'development:startups' do
  puts 'Seeding founders'

  admin_user = User.find_by(email: "admin@acu.com")

  Startup.where(name: admin_user.name).each do |team|
    admin_user.founders.create!(startup: team)
  end

  # Set up Students from database
  (1..3).each do |index|
    student_user = User.find_by(email: "student#{index}@acu.com")
    team = Startup.find_by(name: student_user.name)
    student_user.founders.create!(startup: team)
  end
end

# (1..2).each do |index|
#   coach_user = User.find_by(email: "coach#{inded}@acu.com")
#   team = Start
# end