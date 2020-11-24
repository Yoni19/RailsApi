require 'faker'
User.destroy_all
Article.destroy_all
puts 'Creating users...'

n = 1
10.times do
  User.create!(
    first_name: "seed#{n}",
    last_name: "Fseed",
    username: "created_from_seed#{n}",
    email: "seededuser#{n}@yopmail.com",
   password: "111111"
 )
  n += 1
end
puts 'Creating Articles...'
x=1
10.times do
Article.create(title:Faker::Books::CultureSeries.book, content:Faker::Books::Lovecraft.sentence,user_id:"#{x}")
x += 1
  end

puts "#{User.all.size} users created"
puts "#{Article.all.size} articles created"