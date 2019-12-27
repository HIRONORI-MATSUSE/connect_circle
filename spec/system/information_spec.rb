require 'rails_helper'


RSpec.describe 'Information', type: :system do
  before do
    @clinic = FactoryBot.create(:clinic)
    @user = FactoryBot.create(:user)
    @doctor = FactoryBot.create(:doctor, user: @user, clinic: @clinic)
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end

  it 'information作成のテスト' do
    visit new_staff_information_path
    fill_in "Comment", with: "本日は休診"
    click_button '登録する'
    expect(page).to have_content 'お知らせを作成しました'
  end
end