puts "Seeding schools (production, idempotent)"

School.where(name: 'ACU').first_or_create!

school = School.first
school.users.where(email: 'admin@acu.com').first_or_create!(name: 'Admin User', title: 'Super Admin', password: 'foobar')

user = User.find_by(email: 'admin@acu.com')

  School.all.each do |school|
    SchoolAdmin.where(user: user, school: school).first_or_create!
  end

  AdminUser.where(email: 'admin@acu.com').first_or_create!(fullname: 'Development Admin', username: 'foobar')

