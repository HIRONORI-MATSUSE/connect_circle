require 'rails_helper'

RSpec.describe Information, type: :model do
  it "intormationが空ならバリデーションが通らない" do
    information = Information.new(comment: '')
    expect(information).not_to be_valid
  end

  it "内容が記載されていればバリデーションが通る" do
    information = FactoryBot.create(:information)
    information = Information.create( comment: "本日は休診です",　clinic_id: "1")  
    expect(information.errors).to_not include("を入力してください")
    end
end
