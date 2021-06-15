# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {
    username: 'user_001',
    email: 'user_001@example.com',
    password: 'secret',
    password_confirmation: 'secret'
  },
  {
    username: 'user_002',
    email: 'user_002@example.com',
    password: 'secret',
    password_confirmation: 'secret'
  },
  {
    username: 'user_003',
    email: 'user_003@example.com',
    password: 'secret',
    password_confirmation: 'secret'
  }
])

Post.create([
  {
    title: 'A clever post!',
    body: 'A lot of very interesting ideas to share',
    user_id: 1
  },
  {
    title: 'Another clever post!',
    body: 'A lot of very interesting new ideas to share, yet again!',
    user_id: 1
  },
  {
    title: 'Interesting ideas about programming',
    body: 'This is the best way to become a good programmer!',
    user_id: 2
  }
])