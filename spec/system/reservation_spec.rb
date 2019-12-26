require 'rails_helper'

RSpec.describe 'reservation', type: :system do
  before do
    @clinic = FactoryBot.create(:clinic)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:third_user )
    @doctor = FactoryBot.create(:doctor, user: @user1, clinic: @clinic)
    @patient = FactoryBot.create(:patient, user: @user2)
    @patient = FactoryBot.create(:reservation)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test3@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end
  
    it '治療院から予約ができる事' do
      find("#clinic_index").click
      fill_in "clinic[name_address_search]", with: "松木"
      click_on '検索'
      click_on '詳細'
      expect(page).to have_content '松木'
      find("#booking").click
      all(".fc-bgevent").last.click
      first(".fc-widget-content").click
      click_on '登録する'
      expect(page).to have_content '作成しました'
    end
end