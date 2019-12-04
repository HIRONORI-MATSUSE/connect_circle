i = 1
40.times {
  User.seed do |s|
    s.email = "test#{i}@gmail.com"
    s.password = "password"
    i += 1
  end
}
