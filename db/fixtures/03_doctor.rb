require 'faker'

# i = 1
# 5.times {
#   gimei = Gimei.new
#   Doctor.seed do |s|
#     s.user_id = User.find_by(id: "#{i}").id
#     s.clinic_id = Clinic.find_by(id: 1).id
#     s.name = gimei.name.kanji
#     s.name_kana = gimei.name.hiragana
#     s.gender = "#{rand(0...2)} ".to_i
#     s.birthday = "2019-12-11"
#     s.phone_number = "000-1234-5678"
#     s.comment = "aaaaa"
#     s.image = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png"))
#     s.admin = Faker::Boolean.boolean 
#     i += 1
#   end
# }

clinic = Clinic.first
image2 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png"))
# image2 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_157_s256_f_object_157_0bg.jpg"))
# image3 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_153_s256_f_object_153_0nbg.jpg"))
# image4 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_100_s256_f_object_100_0bg.jpg"))
# images = image1, image2, image3, image4

threads = []
User.take(20).each do |user|
  threads << Thread.new do
    ActiveRecord::Base.connection_pool.with_connection do
      gimei = Gimei.new.name
      user.build_doctor(
        name: gimei.kanji,
        name_kana: gimei.hiragana,
        clinic_id: clinic.id,
        gender: rand(0...2),
        birthday: Time.new,
        phone_number: 2989,
        comment: "お大事にどうぞ",
        image: image2,
        admin: Faker::Boolean.boolean
      ).save
    end
  end
end
threads.each(&:join)


# i = 0
# User.all.take(20).each_slice(5) do |user_arr|
#   user_arr.each do |user|
#     gimei = Gimei.new.name
#     user.build_doctor(
#       name: gimei.kanji,
#       name_kana: gimei.hiragana,
#       clinic_id: clinic.id,
#       gender: rand(0...2),
#       birthday: Time.new,
#       phone_number: 2989,
#       comment: "医療ミス上等",
#       image: images[i],
#       admin: Faker::Boolean.boolean
#     ).save
#   end
#   i += 1
# end

# image = Pathname.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")).open
# gimei = Gimei.new.name
# @doctor = User.first.build_doctor(
#     name: gimei.kanji,
#     name_kana: gimei.hiragana,
#     clinic_id: clinic.id,
#     gender: rand(0...2),
#     birthday: Time.new,
#     phone_number: 2989,
#     comment: "医療ミス上等",
#     image: file,
#     admin: Faker::Boolean.boolean
#   )
#   @doctor.save


