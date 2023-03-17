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
  name: "Daniel",
  last_name: 'Godoy '
)

puts "creando questions"
# Create questions for common_user
Question.create!(
  title: '¿Cuáles son algunos consejos para organizar los impuestos de tu startup?',
  description: "Como propietario de una startup, la organización de los impuestos es crucial para garantizar el cumplimiento y evitar penalizaciones.",
  category: "Impuestos",
  status: "choosing",
  user: common_user
)

Question.create!(
  title: '¿Cuáles son los pasos para registrar una marca comercial?',
  description: 'Quiero proteger el nombre y el logo de mi negocio. ¿Cuáles son los requisitos legales y los pasos que debo seguir para registrar una marca comercial?',
  category: "Leyes",
  status: "choosing",
  user: common_user
)

Question.create!(
  title: '¿Cómo creo un contrato legalmente vinculante?',
  description: 'Necesito redactar un contrato para mi negocio. ¿Cuáles son los elementos esenciales de un contrato legalmente vinculante y cómo puedo asegurarme de que sea ejecutable?',
  category: "Empresas",
  status: "choosing",
  user: common_user
)

puts "creating new user"
# Create a new USER
new_user = User.create!(
  email: 'other_user@example.com',
  password: 'password',
  name: "Nicolás",
  last_name: 'Navarrete'
)

puts "creating questions for new_user"
# Create questions for new_user
Question.create!(
  title: '¿Cómo puedo proteger mi marca registrada?',
  description: 'He creado una marca para mi empresa y quiero asegurarme de que esté protegida legalmente. ¿Cuáles son los pasos necesarios para registrar y proteger mi marca?',
  category: "Legal",
  status: "choosing",
  user: new_user
)

Question.create!(
  title: '¿Cuáles son mis obligaciones fiscales como propietario de una pequeña empresa?',
  description: 'Recientemente comencé una pequeña empresa y necesito saber cuáles son mis obligaciones fiscales. ¿Qué impuestos debo pagar y cuándo debo hacerlo?',
  category: "Empresas",
  status: "choosing",
  user: new_user
)

Question.create!(
  title: '¿Cómo puedo redactar un contrato de servicios?',
  description: 'Necesito redactar un contrato de servicios para mi empresa, pero no estoy seguro de qué debe incluir. ¿Cuáles son los elementos clave que debo tener en cuenta al redactar un contrato de servicios?',
  category: "Personas",
  status: "choosing",
  user: new_user
)

puts "creating new lawyer"
# Create a new LAWYER
lawyer = User.create!(
  email: 'lawyer@example.com',
  password: 'password',
  name: "Stefano",
  last_name: 'Amodei',
  lawyer: true
)

puts "creating answers for common_user"
# Create answers for common_user's questions
common_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 100,
    comment: 'Estoy interesado en responder esta pregunta. Estoy más que calificado para proporcionar una respuesta detallada.',
    avg_time: 2,
    payment_status: 'sent',
    user: lawyer
  )
end

puts "creating answers for new_user"
# Create answers for new_user's questions
new_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 150,
    comment: 'Como profesional experimentado en este campo, puedo ofrecer información valiosa sobre estrategias exitosas y brindar perspectivas útiles para lograr el éxito en este ámbito. Estoy seguro de que mi experiencia y conocimientos pueden ser de gran ayuda.',
    avg_time: 3,
    payment_status: 'sent',
    user: lawyer,
  )
end
puts "creating another lawyer"
# Create another LAWYER
another_lawyer = User.create!(
  email: 'another_lawyer@example.com',
  password: 'password',
  name: "Tomás",
  last_name: 'Águila ',
  lawyer: true
)

puts "creating answers for common_user by another_lawyer"
# Create answers for common_user's questions by another_lawyer
common_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 120,
    comment: 'Soy un especialista en esta área y puedo proporcionar un asesoramiento detallado y práctico para su situación específica.',
    avg_time: 2.5,
    payment_status: 'sent',
    user: another_lawyer,
  )
end

puts "creating answers for new_user by another_lawyer"
# Create answers for new_user's questions by another_lawyer
new_user.questions.each do |question|
  Answer.create!(
    question: question,
    price: 180,
    comment: 'He ayudado a numerosos clientes en situaciones similares y puedo ofrecer estrategias personalizadas para lograr sus objetivos específicos. Mi experiencia previa en la resolución de problemas similares a los suyos me permite entender las complejidades de su situación.',
    avg_time: 3.5,
    payment_status: 'sent',
    user: another_lawyer,
  )
end


puts "creating fake reviews"
reviews = [
  { rating: 4, comment: "¡Este es un gran abogado, lo recomiendo altamente!", user: lawyer },
  { rating: 5, comment: "Nunca antes había estado tan impresionado con un abogado, ¡superó todas mis expectativas!", user: lawyer },
  { rating: 3, comment: "Es un abogado decente, pero he tenido mejores.", user: lawyer },
  { rating: 2, comment: "Realmente me decepcionó este abogado, no cumplió con el hype.", user: lawyer },
  { rating: 4, comment: "En general, estoy bastante satisfecho con este abogado.", user: lawyer },
  { rating: 1, comment: "Este es el peor abogado que he tenido, no lo recomendaría a nadie.", user: lawyer },
  { rating: 5, comment: "¡No puedo decir suficientes cosas buenas sobre este abogado, es simplemente increíble!", user: another_lawyer },
  { rating: 3, comment: "Es un abogado aceptable, pero no diría que es algo especial.", user: another_lawyer },
  { rating: 4, comment: "Estoy bastante contento con este abogado, hace lo que se supone que debe hacer.", user: another_lawyer },
  { rating: 2, comment: "Lamento haber contratado este abogado, desearía haber elegido a alguien más.", user: another_lawyer }
  ]
reviews.each do |review|
  # lawyer.Review.create!(review)
  Review.create!(review)
end

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
