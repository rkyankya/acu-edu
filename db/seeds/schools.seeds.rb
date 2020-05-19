puts "Seeding schools (production, idempotent)"

School.where(name: 'ACU').first_or_create!
