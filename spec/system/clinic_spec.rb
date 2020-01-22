require 'rails_helper'

RSpec.describe 'clinic', type: :system do
  before do
    @clinic = FactoryBot.create(:clinic)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:third_user )
    @doctor = FactoryBot.create(:doctor, user: @user1, clinic: @clinic)
    @patient = FactoryBot.create(:patient, user: @user2)
    @reservations = FactoryBot.create(:reservation, patient: @patient, clinic: @clinic)
    @information = FactoryBot.create(:information, clinic: @clinic)
    @reservations = FactoryBot.create(:second_reservation, patient: @patient, clinic: @clinic)
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end

  it '予約の編集で同じ時間で作成するとバリデーションがかかるできる事' do
    find("#clinic_show").click
    find(:xpath, '/html/body/main/div[1]/table[2]/tbody[2]/tr/td[3]/a').click
    click_button '変更する'
    expect(page).to have_content 'すでに予約が入っています。編集できませんでした。'
  end

  it '予約の削除ができる' do
    find("#clinic_show").click
    find(:xpath, '/html/body/main/div[1]/table[2]/tbody[2]/tr/td[4]/a').click
    expect(page).to have_content '予約をキャンセルしました'
    
  end

  it 'お知らせの編集ができる' do
    find("#clinic_show").click
    find(:xpath, '/html/body/main/div[3]/table/tbody/tr[2]/td[2]/a').click
    click_on '更新する'
    expect(page).to have_content 'お知らせを編集しました'
  end

  it 'お知らせの削除ができる' do
    find("#clinic_show").click
    find(:xpath, '/html/body/main/div[3]/table/tbody/tr[2]/td[3]/a').click
    expect(page).to have_content 'お知らせを削除しました！'
  end

  it '全ての予約ができる' do
    find("#clinic_show").click
    find(:xpath, '/html/body/main/div[1]/a[1]').click
    expect(page).to have_content '高木 沙織'
  end

  it '本日の予約が確認できる' do
    find("#clinic_show").click
    find(:xpath, '/html/body/main/div[1]/a[2]').click
    expect(page).to have_content '高木 沙織'
  end
end