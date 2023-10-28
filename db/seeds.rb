50.times do
  name = Faker::Name.name
  email = Faker::Internet.unique.free_email
  password = Faker::Internet.password(min_length: 6)
  

  user = User.new(
                  name: name,
                  email: email,
                  password: password,
                  password_confirmation: password
                  )
                  user.skip_confirmation!
                  user.save!
end