i = 21
20.times {
  gimei = Gimei.new
  Patient.seed do |s|
    s.user_id = User.find_by(id: "#{i}".to_i).id
    s.name = gimei.name.kanji
    s.name_kana = gimei.name.hiragana
    s.gender = "#{rand(0...2)} "
    s.birthday = "1900-12-01"
    s.address = gimei.address.prefecture.kanji
    s.phone_number = "000-1234-5678".to_i
    s.image = File.join(Rails.root, "db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")
    i += 1
  end
}
