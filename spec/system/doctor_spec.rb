require 'rails_helper'

RSpec.describe 'doctor', type: :system do
  before do
    @clinic = FactoryBot.create(:clinic)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:third_user )
    @doctor = FactoryBot.create(:doctor, user: @user1, clinic: @clinic)
    @patient = FactoryBot.create(:patient, user: @user2)
    @reservation = FactoryBot.create(:reservation, patient: @patient, clinic: @clinic)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end
  
  it 'プロフィールの編集ができる事' do
      click_on 'プロフィール編集'
      # fill_in "doctor[name]", with: "松木 明典"
      # fill_in "doctor[name_kana]", with: "まつき あきのり"
      select '男', from: 'doctor_gender'
      select '2019', from: 'doctor_birthday_1i'
      select '12', from: 'doctor_birthday_2i'
      select '12', from: 'doctor_birthday_3i'
      fill_in "doctor[phone_number]", with: "1234567891"
      fill_in "doctor[comment]", with: "お大事にどうぞ"
      click_button '編集する'
      expect(page).to have_content '編集しました'
    end

    it 'メールアドレスとパスワードを編集ができる事' do
      click_on 'メールアドレスとパスワード編集'
      fill_in "user[email]", with: "test1@gmail.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button '編集する'
      expect(page).to have_content 'すでにログインしています'
    end

    it 'スタッフ一覧で検索ができる事' do
      find("#staff_index").click
      fill_in "doctor[name_search]", with: "松木"
      click_on '検索'
      expect(page).to have_content '松木'
    end

    it '患者一覧で検索ができる事' do
      find("#patient_index").click
      fill_in "patient[name_search]", with: "高木"
      click_on '検索'
      expect(page).to have_content '高木'
    end
end