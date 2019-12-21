
image3 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_100_s256_f_object_100_0bg.jpg"))

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
        phone_number: 12312345678,
        address: "渋谷区",
        image: image3
      ).save
    end
  end
end
threads.each(&:join)
