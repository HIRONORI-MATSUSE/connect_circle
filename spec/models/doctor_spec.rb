require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it "名前が空ならバリデーションが通らない" do
    doctor = Doctor.new(name: '')
    expect(doctor).not_to be_valid
  end

  it "ふりがなが空ならバリデーションが通らない" do
    doctor = Doctor.new(name_kana: '')
    expect(doctor).not_to be_valid
  end

  it "誕生日が空ならバリデーションが通らない" do
    doctor = Doctor.new(birthday: '')
    expect(doctor).not_to be_valid
  end

  it "電話番号が空ならバリデーションが通らない" do
    doctor = Doctor.new(phone_number: '')
    expect(doctor).not_to be_valid
  end

  it "内容が記載されていればバリデーションが通る" do
    clinic = FactoryBot.create(:clinic)
    user = FactoryBot.create(:user)
    doctor = FactoryBot.create(:doctor, user: user, clinic: clinic)
    expect(doctor.errors).to_not include("を入力してください")
  end
end
