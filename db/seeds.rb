User.create!( name: "Administrator",
              email: "admin@textmyphone.com",
              password: "iuytrewq",
              password_confirmation: "iuytrewq",
              admin: true,
              activated: true)

10.times do |n|
  name = Faker::Name.name
  email = ""
  8.times{email << (65 + rand(25)).chr}
  email += "@hmail.com"
  User.create(
    name: name,
    email: email,
    password: "iuytrewq",
    password_confirmation: "iuytrewq"
  )
end