# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creando usuario comun"
# Create common USER
common_user = User.create!(
  email: 'user@example.com',
  password: 'password'
)

puts "creando questions"
# Create questions for common_user
Question.create!(
  title: 'How can I organize my taxes?',
  description: 'I am building my start up................... sdbasjfbadshcfbdaskcckhdsabckjdbckjdsbckjsdbcjdkcbsjkdbc',
  category: "Tax",
  user: common_user
)

Question.create!(
  title: 'How can I organize my taxes?',
  description: 'I am building my start up................... sdbasjfbadshcfbdaskcckhdsabckjdbckjdsbckjsdbcjdkcbsjkdbc',
  category: "Tax",
  user: common_user
)

Question.create!(
  title: 'How can I organize my taxes?',
  description: 'I am building my start up................... sdbasjfbadshcfbdaskcckhdsabckjdbckjdsbckjsdbcjdkcbsjkdbc',
  category: "Tax",
  user: common_user
)

Question.create!(
  title: 'How can I organize my taxes?',
  description: 'I am building my start up................... sdbasjfbadshcfbdaskcckhdsabckjdbckjdsbckjsdbcjdkcbsjkdbc',
  category: "Tax",
  user: common_user
)

puts "creating new user"
# Create a new USER
new_user = User.create!(
  email: 'new_user@example.com',
  password: 'password'
)

puts "creating questions for new_user"
# Create questions for new_user
Question.create!(
  title: 'What are some good marketing strategies for a small business?',
  description: 'I recently started a small business and I am looking for some effective marketing strategies.',
  category: "Marketing",
  user: new_user
)

Question.create!(
  title: 'What is the best way to raise funding for a tech startup?',
  description: 'I have a great idea for a tech startup, but I need funding to make it a reality. What are some effective ways to raise funds?',
  category: "Startup",
  user: new_user
)

Question.create!(
  title: 'What are the top skills required for a successful career in software development?',
  description: 'I am interested in pursuing a career in software development. What are the key skills I should focus on developing?',
  category: "Software Development",
  user: new_user
)



puts "creating new lawyer"
# Create a new LAWYER
lawyer = User.create!(
  email: 'lawyer@example.com',
  password: 'password'
)

puts "creating answers for common_user"
# Create answers for common_user's questions
common_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 100,
    comment: 'I am interested in answering this question. I am more than qualified to provide a thorough response.',
    avg_time: 2,
    user: lawyer,
  )
end

puts "creating answers for new_user"
# Create answers for new_user's questions
new_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 150,
    comment: 'As a seasoned professional in this field, I can offer valuable insights and strategies for success.',
    avg_time: 3,
    user: lawyer,
  )
end
puts "creating another lawyer"
# Create another LAWYER
another_lawyer = User.create!(
  email: 'another_lawyer@example.com',
  password: 'password'
)

puts "creating answers for common_user by another_lawyer"
# Create answers for common_user's questions by another_lawyer
common_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 120,
    comment: 'I am a specialist in this area and can provide detailed and actionable advice for your situation.',
    avg_time: 2.5,
    user: another_lawyer,
  )
end

puts "creating answers for new_user by another_lawyer"
# Create answers for new_user's questions by another_lawyer
new_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 180,
    comment: 'I have helped numerous clients in similar situations and can offer personalized strategies to achieve your goals.',
    avg_time: 3.5,
    user: another_lawyer,
  )
end

