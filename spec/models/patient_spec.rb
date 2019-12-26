require 'rails_helper'

RSpec.describe Patient, type: :model do
  it "名前が空ならバリデーションが通らない" do
    patient = Patient.new(name: '')
    expect(patient).not_to be_valid
  end

  it "ふりがなが空ならバリデーションが通らない" do
    patient = Patient.new(name_kana: '')
    expect(patient).not_to be_valid
  end

  it "誕生日が空ならバリデーションが通らない" do
    patient = Patient.new(birthday: '')
    expect(patient).not_to be_valid
  end

  it "住所が空ならバリデーションが通らない" do
    patient = Patient.new(address: '')
    expect(patient).not_to be_valid
  end

  it "名前が空ならバリデーションが通らない" do
    patient = Patient.new(name: '')
    expect(patient).not_to be_valid
  end

  it "電話番号が空ならバリデーションが通らない" do
    patient = Patient.new(phone_number: '')
    expect(patient).not_to be_valid
  end

   it "内容が記載されていればバリデーションが通る" do
    user = FactoryBot.create(:user)
    patient = FactoryBot.create(:patient, user: user)
    expect(patient.errors).to_not include("を入力してください")
  end
end