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
  password: 'password',
  name: "user name",
  last_name: 'user last name '
)

puts "creando questions"
# Create questions for common_user
Question.create!(
  title: 'Tips for Organizing Taxes for Your Startup?',
  description: "As a startup owner, tax organization is crucial to ensure compliance and avoid penalties. What are some practical tips to help me organize my startup taxes effectively?",
  category: "Tax",
  user: common_user
)

Question.create!(
  title: 'What are the steps to register a trademark?',
  description: 'I want to protect my business name and logo. What are the legal requirements and steps I need to take to register a trademark?',
  category: "Legal",
  user: common_user
)

Question.create!(
  title: 'How do I create a legally binding contract?',
  description: 'I need to draft a contract for my business. What are the essential elements of a legally binding contract, and how can I ensure its enforceable?',
  category: "Contract",
  user: common_user
)

Question.create!(
  title: 'What is the process for forming an LLC?',
  description: "I want to establish a limited liability company (LLC) for my business. What are the legal requirements and steps involved in forming an LLC, and what are the benefits?",
  category: "LLC",
  user: common_user
)

puts "creating new user"
# Create a new USER
new_user = User.create!(
  email: 'new_user@example.com',
  password: 'password',
  name: "new_user name",
  last_name: 'new_user last name '
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
  password: 'password',
  name: "lawyer name",
  last_name: 'lawyer last name ',
  lawyer: true
)

puts "creating answers for common_user"
# Create answers for common_user's questions
common_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 100,
    comment: 'I am interested in answering this question. I am more than qualified to provide a thorough response.',
    avg_time: 2,
    user: lawyer
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
  password: 'password',
  name: "other_lawyer name",
  last_name: 'other_lawyer last name ',
  lawyer: true
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


puts "creating fake reviews"
reviews = [
  { rating: 4, comment: "This is a great product, I highly recommend it!" },
  { rating: 5, comment: "I've never been so impressed with a product before, it exceeded all my expectations!" },
  { rating: 3, comment: "It's a decent product, but I've had better." },
  { rating: 2, comment: "I was really disappointed with this product, it didn't live up to the hype." },
  { rating: 4, comment: "Overall, I'm pretty satisfied with this product." },
  { rating: 1, comment: "This is the worst product I've ever used, I wouldn't recommend it to anyone." },
  { rating: 5, comment: "I can't say enough good things about this product, it's simply amazing!" },
  { rating: 3, comment: "It's an okay product, but I wouldn't say it's anything special." },
  { rating: 4, comment: "I'm pretty happy with this product, it does what it's supposed to do." },
  { rating: 2, comment: "I regret buying this product, I wish I had chosen something else." }
]

# reviews.each do |review|
#   lawyer.Review.create!(review)
# end
puts "Creating categories..."
Category.create!(
  name: 'Impuestos'
)
Category.create!(
  name: 'Leyes'
)
Category.create!(
  name: 'Empresas'
)
Category.create!(
  name: 'Personas'
)
