# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
customer3 = Customer.create!(name: "Dustin Chen", email: "dchen@gmail.com")


tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
tea2 = Tea.create!(title: "Oolong Tea", description: "Description 2", brew_time: 7)
tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

Subscription.create!(customer_id: customer1.id, tea_id: tea1.id, price: 5.99, frequency_monthly: 5)
