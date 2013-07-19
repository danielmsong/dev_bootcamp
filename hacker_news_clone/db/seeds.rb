10.times do
  User.create(
    username:     Faker::Internet.user_name, 
    firstname:    Faker::Name.first_name, 
    lastname:     Faker::Name.last_name,
    email:        Faker::Internet.email,
    password:     "password"
    )
end

20.times do
  post = Post.create(
    title:        Faker::Lorem.sentence,
    content:      Faker::Lorem.paragraphs.join(""),
    user_id:      rand(10)+1
    )

 post.pvotes << Pvote.create
end

80.times do 
  comment = Comment.create(
    text:         Faker::Lorem.paragraphs.join(""),
    user_id:      rand(10)+1,
    post_id:      rand(20)+1,
    )  

  comment.cvotes << Cvote.create   
end
