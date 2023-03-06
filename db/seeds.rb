puts "🌱 Seeding spices..."

# Seed your database here
a1 = Author.create(name: 'Albert Einstein')

q1 =Quote.create(title: "Life Style", 
    category: "motivational", 
    description: 'We cannot solve problems with the kind of thinking we employed when we came up with them.',
    author_id: a1.id
)
u1 = User.create(username: 'Robert')

c1 = Comment.create(comment: 'nice quote',
    quote_id: q1.id,
    user_id: u1.id
)

puts "✅ Done seeding!"
