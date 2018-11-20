# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
User.destroy_all
Chat.destroy_all

chat = Chat.create
user = User.create(email: "adlyne@gmail.com", password: "123456")

m1 = Message.create(chat: chat, user: user, content: "First Message!")
Message.create(chat: chat, user: user, content: "Second Message!")
Message.create(chat: chat, user: user, content: "Third Message!")
