
i = 1
20.times {
  Clinic.seed do |s|
    s.name = "松瀬#{i}鍼灸整骨院",
    s.address = "渋谷区一丁目#{i}番地",
    s.phone_number = "03-1244-5478",
    s.image = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/the-road-815297__480.jpg"))
    i += 1
  end
}

# threads = []
# User.last(20).each do |user|
#   threads << Thread.new do
#     ActiveRecord::Base.connection_pool.with_connection do
#       gimei = Gimei.new.name
#       user.build_patient(
#         name: gimei.kanji,
#         name_kana: gimei.hiragana,
#         gender: rand(0...2),
#         birthday: Time.new,
#         phone_number: 111111111,
#         address: "渋谷区",
#         image: image2
#       ).save
#     end
#   end
# end
# threads.each(&:join)


