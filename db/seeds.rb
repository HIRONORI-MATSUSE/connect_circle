# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Clinic.create!(
  [
    {
      name: '松瀬鍼灸整骨院',
      address: '渋谷区',
      phone_number: '03-1234-5678',
      image: 'string'
    }
  ]
)

User.create!(
  [
    {
      email: 'test@gmail.com',
      password: '123456',
      admin: 'true'
    }
  ]
)

Doctor.create!(
  [
    {
      name: '松瀬',
      name_kana: 'まつせ',
      gender: '1',
      birthday: '2019-12-01',
      phone_number: '090-1234-5678',
      comment: 'aaaaa',
      image: 'string',
      admin: 'true'
    }
  ]
)
