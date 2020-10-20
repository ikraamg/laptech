# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(username: "ikraam", password: "password", email: 'admin@admin.com', admin:true)

Tech.create(title: 'MacBook Pro', description: '17-inch, Intel i5, 8gb Ram, 256Gb SSD', category: 'Laptops', price: '10000', cost: '8000', user_id:1)

Tech.create(title: 'Thinkpad', description: '15-inch, Intel i7, 16gb Ram, 512Gb SSD', category: 'Laptops', price: '12000', cost: '8000', user_id:1)

Tech.create(title: 'Samsung LED TV', description: '4k TV with Vibrant colours', category: 'Television', price: '20000', cost: '16000', user_id:1)

Tech.create(title: 'Apple Iphone 11', description: 'State of the Art Simplicity', category: 'Cell Phones', price: '30000', cost: '28000', user_id:1)
