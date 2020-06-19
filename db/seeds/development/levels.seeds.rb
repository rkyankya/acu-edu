require_relative 'helper'

after 'development:courses' do
  puts 'Seeding levels'

  Course.all.each do |course|
    (1..3).each do |level_number|
      Level.create!(number: level_number, name: Faker::Lorem.words(number: 3).join(' '), course: course)
    end
  end
end

# course = Course.first
# Level.create!(number: 1, name: 'Begineer', course: course)
# Level.create!(number: 2, name: 'Mid Point', course: course)
# Level.create!(number: 3, name: 'Expert', course: course)
