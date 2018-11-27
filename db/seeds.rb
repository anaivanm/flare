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
EmergencyContact.destroy_all

EmergencyContact.create!(name: "Amager Hopsital", address: "Italiensvej 1 , Copenhagen , Denmark", phone_number: "32 34 30 32", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "Bispebjerg Hospital", address: "Bispebjerg Bakke 23 , Copenhagen 2400 , Denmark", phone_number: "35 31 35 31", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "Hvidovre Hospital", address: "Kettegard Alle 30 , Hvidovre , Copenhagen 2650, Denmark", phone_number: "36 32 36 32", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "Rigshospitalet", address: "Blegdamsvej 9 , Copenhagen 2100 , Denmark", phone_number: "35 44 10 00", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "​Børne- og Ungdomspsykiatrisk Center", address: "Ndr. Ringvej 29-67, 2600 Glostrup ", phone_number: "38 64 06 71", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "Psy​kiatrisk Center Amager", address: "Digevej 110, 2300 Copenhagen", phone_number: "38 64 16 50 ", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "​Psykiatrisk Center København", address: "Tuborgvej 235, 2400 Copenhagen", phone_number: "38 64 73 60", opening: 0000, closing: 2400)
EmergencyContact.create!(name: "Livslinien", phone_number: "70 201 201", opening: 1100, closing: 2300)
EmergencyContact.create!(name: "Suicide Helpline", phone_number: "1813", opening: 0000, closing: 2400)

chat = Chat.create!
user = User.create!(email: "adlyne@gmail.com", password: "123456")
helper = User.create!(email: "helper@sendaflare.com", password: "123456", is_helper: true, username: "Irene")

m1 = Message.create!(chat: chat, user: user, content: "First Message!")
Message.create!(chat: chat, user: user, content: "Second Message!")
Message.create!(chat: chat, user: user, content: "Third Message!")
