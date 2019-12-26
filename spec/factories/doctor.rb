FactoryBot.define do
  factory :doctor do
    name { '松木 明典' }
    name_kana { 'まつき　あきのり' }
    gender {0}
    birthday { Date.today }
    phone_number { 1234567891 }
    comment { 'お大事にどうぞ' }
    admin { 'true' }
    qualification { '柔道整復師' }
    image { Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")) }
  end

  factory :second_doctor, class: Doctor do
    name { '中村 健吾' }
    name_kana { 'なかむら　けんご' }
    gender {0}
    birthday { Date.today }
    phone_number { 1765456789 }
    comment { 'お大事にどうぞ' }
    admin { 'false' }
    qualification { '鍼灸師' }
    image { Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")) }
  end
end