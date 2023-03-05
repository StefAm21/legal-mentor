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

# common_user.questions.create!(
#   title: 'How can I do correctly my divorce papers?',
#   description: 'I am ending my marriage................... sdbasjfbadshcfbdaskcckhdsabckjdbckjdsbckjsdbcjdkcbsjkdbc',
#   category: " ",
#   status: " "
# )

# common_user.questions.create!(
#   title: 'How can I do a succession of lands?',
#   description: 'I am inhariting some lands................... sdbasjfbadshcfbdaskcckhdsabckjdbckjdsbckjsdbcjdkcbsjkdbc',
#   category: " ",
#   status: " "
# )
