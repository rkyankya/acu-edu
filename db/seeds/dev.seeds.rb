School.where(name: 'ACU').first_or_create!

school = School.first
school.users.where(email: 'admin@acu.com').first_or_create!(name: 'Admin User', title: 'Super Admin', password: 'foobar')

user = User.find_by(email: 'admin@acu.com')

  School.all.each do |school|
    SchoolAdmin.where(user: user, school: school).first_or_create!
  end

  AdminUser.where(email: 'admin@acu.com').first_or_create!(fullname: 'Development Admin', username: 'foobar')


  %w[acu.localhost www.acu.localhost 127.0.0.1].each do |school_domain|
    school.domains.where(
      fqdn: school_domain,
      primary: school_domain == 'www.acu.localhost'
    ).first_or_create!
  end

  (1..10).each do |index|
    school.users.create!(email: "student#{index}@student.acu.com", name: Faker::Name.name, title: 'Student', password: 'foobar')
  end

  # Add two users to be coaches in first school.
  (1..3).each do |index|
    school.users.create!(
      email: "coach#{index}@coach.acu.com",
      name: Faker::Name.name,
      password: 'foobar',
      title: Faker::Job.title,
    )
  end

