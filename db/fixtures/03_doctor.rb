require 'faker'

i = 1
20.times {
  gimei = Gimei.new
  Doctor.seed do |s|
    s.user_id = User.find_by(id: "#{i}".to_i)
    s.clinic_id = Clinic.find_by(id: 1)
    s.name = gimei.name.kanji
    s.name_kana = gimei.name.hiragana
    s.gender = gimei.name
    s.birthday = "2019-12-#{i}"
    s.phone_number = "0#{i}-1234-5678"
    s.comment = "aaaaa"
    # s.image = File.open("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")
    s.image = File.join(Rails.root, "db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")
    s.admin = Faker::Boolean.boolean 
    i += 1
  end
}

