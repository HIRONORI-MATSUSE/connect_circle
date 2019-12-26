FactoryBot.define do
  factory :patient do
    name { '高木 沙織' }
    name_kana { 'たかぎ　さおり' }
    gender {1}
    birthday { Date.today }
    address { '杉並区' }
    phone_number { 12358609128 }
    image { Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")) }
  end

  factory :second_patient, class: Patient do
    name { '菊池 達也' }
    name_kana { 'きくち　たつや' }
    gender {0}
    birthday { Date.today }
    address { '港区' }
    phone_number { 99876349128 }
    image { Rack::Test::UploadedFile.new(Rails.root.join("db/fixtures/images/f_f_object_174_s256_f_object_174_0bg.png")) }
  end
end