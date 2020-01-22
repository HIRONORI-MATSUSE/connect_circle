require 'rails_helper'

RSpec.describe 'patient', type: :system do
  before do
    @clinic = FactoryBot.create(:clinic)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:third_user )
    @doctor = FactoryBot.create(:doctor, user: @user1, clinic: @clinic)
    @patient = FactoryBot.create(:patient, user: @user2)
    @reservation = FactoryBot.create(:reservation, patient: @patient, clinic: @clinic)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test3@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end
  
  it 'プロフィールの編集ができる事' do
    click_on 'プロフィール編集'
    fill_in "patient[name]", with: "高木 沙織"
    fill_in "patient[name_kana]", with: "たかぎ さおり"
    select '女', from: 'patient_gender'
    select '2019', from: 'patient_birthday_1i'
    select '12', from: 'patient_birthday_2i'
    select '12', from: 'patient_birthday_3i'
    fill_in "patient[address]", with: "渋谷区"
    fill_in "patient[phone_number]", with: "12312345678"
    click_button '編集'
    expect(page).to have_content '編集しました'
  end

  it 'メールアドレスとパスワードを編集ができる事' do
    click_on 'メールアドレスとパスワード編集'
    fill_in "user[email]", with: "test3@gmail.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button '編集する'
    expect(page).to have_content 'すでにログインしています'
  end

  it '治療院一覧から検索をして治療院選択ができる事' do
      find("#clinic_index").click
    fill_in "clinic[name_address_search]", with: "松木"
    click_on '検索'
    click_on '詳細'
    expect(page).to have_content '松木'
  end

  it '治療院から予約ができる事' do
    find("#clinic_index").click
    fill_in "clinic[name_address_search]", with: "松木"
    click_on '検索'
    click_on '詳細'
    find("#booking").click
    all(".fc-bgevent").last.click
    first(".fc-widget-content").click
    click_on '登録する'
    expect(page).to have_content '作成しました'
  end

  it '同じ日に予約が変更しようとすると変更ができないようにする事' do
    find("#clinic_index").click
    fill_in "clinic[name_address_search]", with: "松木"
    click_on '検索'
    click_on '詳細'
    find("#booking").click
    all(".fc-bgevent").last.click
    first(".fc-widget-content").click
    click_on '登録する'
    find(:xpath, '/html/body/main/div/table[3]/tbody/tr[2]/td[3]/a').click
    click_on '変更する'
    expect(page).to have_content 'すでに予約が入っています。編集できませんでした。'
  end

  it '予約が削除ができる事' do
    find("#clinic_index").click
    fill_in "clinic[name_address_search]", with: "松木"
    click_on '検索'
    click_on '詳細'
    find("#booking").click
    all(".fc-bgevent").last.click
    first(".fc-widget-content").click
    click_on '登録する'
    find(:xpath, '/html/body/main/div/table[3]/tbody/tr[2]/td[4]/a').click
    expect(page).to have_content '削除しました.'
  end
end