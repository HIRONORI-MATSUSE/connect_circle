image1 = Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/the-road-815297__480.jpg"))

threads = []
i = 1
20.times do
  threads << Thread.new do
    ActiveRecord::Base.connection_pool.with_connection do
      Clinic.create(
        name: "松瀬#{i}鍼灸整骨院",
        address: "渋谷区一丁目#{i}番地",
        phone_number: "03-1244-5478",
        image: image1
      )
    end
  end
  i += 1
end
threads.each(&:join)


