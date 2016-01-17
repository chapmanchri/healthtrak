User.create!(email:       "example@railstutorils.org",
             password: "foobar",
             password_confirmation: "foobar",
             acceptance: true,
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  acceptance = true
  User.create!(email: email,
                password: password,
                password_confirmation: password,
                acceptance: acceptance,
                activated: true,
                activated_at: Time.zone.now)
end
