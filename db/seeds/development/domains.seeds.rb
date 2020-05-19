after 'development:schools' do
  puts 'Seeding domains (idempotent)'

  # Domains for school.
  school = School.first

  %w[acu.localhost www.acu.localhost 127.0.0.1].each do |school_domain|
    school.domains.where(
      fqdn: school_domain,
      primary: school_domain == 'www.acu.localhost'
    ).first_or_create!
  end

  # Domains for second school.
  second_school = School.last

  %w[school2.localhost www.school2.localhost].each do |school_2_domain|
    second_school.domains.where(
      fqdn: school_2_domain,
      primary: school_2_domain == 'www.school2.localhost'
    ).first_or_create!
  end
end
