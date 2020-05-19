after 'schools' do
  school = School.first

  puts 'Seeding users (production, idempotent)'

  school.users.where(email: 'admin@acu.com').first_or_create!(name: 'Admin User', title: 'Super Admin', password: 'foobar')
  School.first.domains.create!(fqdn: 'acu-edu.herokuapp.com', primary: true)
end
