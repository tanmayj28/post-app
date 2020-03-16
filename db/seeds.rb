# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
visitor = Visitor.create(name:"abcd#{rand(200)}")
visitor2 = Visitor.create(name:"qwer#{rand(200)}")
post = visitor.posts.create(title:"This is #{rand(200)} post", content:"Bullshit")
upvote = post.upvotes.create(visitor_id:visitor2.id)

