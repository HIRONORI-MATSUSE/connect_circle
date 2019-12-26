FactoryBot.define do
  factory :clinic do
    name { '松木鍼灸整骨院' }
    address { '渋谷区' }
    phone_number { 11111111111 }
    image { Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/the-road-815297__480.jpg")) }
  end
end