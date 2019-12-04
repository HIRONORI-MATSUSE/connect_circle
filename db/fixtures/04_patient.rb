i = 21
20.times {
  gimei = Gimei.new
  Patient.seed do |s|
    s.user_id = User.find_by(id: "#{i}".to_i)
    s.name = gimei.name.kanji
    s.name_kana = gimei.name.hiragana
    s.gender = 1
    s.birthday = "19#{i}-12-01"
    s.address = gimei.address.prefecture.kanji
    s.phone_number = "#{i}0-1234-5678"
    s.image = File.join(Rails.root, "db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")
    i += 1
  end
}
