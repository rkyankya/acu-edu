after 'schools' do
  school = School.first

  # puts 'Seeding users (production, idempotent)'

  school.users.where(email: 'admin@acu.com').first_or_create!(name: 'Admin User', title: 'Super Admin', password: 'foobar')
  school.users.where(email: 'student1@acu.com').create!(name: 'First Student ', title: 'Super Admin', password: 'foobar')
  school.users.where(email: 'student2@acu.com').create!(name: 'Second Student', title: 'Super Admin', password: 'foobar')
  school.users.where(email: 'coach1@acu.com').create!(name: 'Course Author', title: 'Course Author', password: 'foobar')
  school.users.where(email: 'coach2@acu.com').create!(name: 'Coach', title: 'Course Coach', password: 'foobar')
  # Production School Domain
  School.first.domains.create!(fqdn: 'acu-edu.herokuapp.com', primary: true)
  school.users.where(email: 'rkyankya@gmail.com').create!(name: 'Kyankya Raymond', title: 'Developer', password: 'foobar')
end
