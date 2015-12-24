require 'faker'

15.times do
  user = User.new({
    email: Faker::Internet.email,
    password: 'password'
    })
  user.save
end

10.times do
  projet = Projet.create!({
    objectif: Faker::Number.between(1000, 10000),
    nom: Faker::Name.title,
    description: Faker::Lorem.paragraph(2),
    user: User.order("random()").first,
    picture: open('https://unsplash.it/800/600/?random'),
    end_date: Date.today + rand(10..200).days
    })
  print '.'
end

10.times do
  contribution = Contribution.create!({
    user: User.order("random()").first,
    projet: Projet.order("random()").first,
    amount: rand(1000..10000)
    })
  print '.'
end
