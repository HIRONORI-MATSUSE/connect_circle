require 'rails_helper'

RSpec.describe 'doctor', type: :system do
  before do
    @clinic = FactoryBot.create(:clinic)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:third_user )
    @doctor = FactoryBot.create(:doctor, user: @user1, clinic: @clinic)
    @patient = FactoryBot.create(:patient, user: @user2)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end
end