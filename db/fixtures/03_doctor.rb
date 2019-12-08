require 'faker'

i = 1
20.times {
  gimei = Gimei.new
  Doctor.seed do |s|
    s.user_id = User.find_by(id: "#{i}").id
    s.clinic_id = Clinic.find_by(id: 1).id
    s.name = gimei.name.kanji
    s.name_kana = gimei.name.hiragana
    s.gender = "#{rand(0...2)} ".to_i
    s.birthday = "2019-12-11"
    s.phone_number = "000-1234-5678"
    s.comment = "aaaaa"
    # s.image = File.open("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")
    s.image = File.join(Rails.root, "db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")
    s.admin = Faker::Boolean.boolean 
    i += 1
  end
}

