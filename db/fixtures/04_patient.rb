# clinic = Clinic.first
image2 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png"))

threads = []
User.last(20).each do |user|
  threads << Thread.new do
    ActiveRecord::Base.connection_pool.with_connection do
      gimei = Gimei.new.name
      user.build_patient(
        name: gimei.kanji,
        name_kana: gimei.hiragana,
        gender: rand(0...2),
        birthday: Time.new,
        phone_number: 111111111,
        address: "aaaaaaaaaa",
        image: image2
      ).save
    end
  end
end
threads.each(&:join)
