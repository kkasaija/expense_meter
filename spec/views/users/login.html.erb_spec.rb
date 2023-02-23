require 'rails_helper'
RSpec.feature 'Login', type: :feature do
  before :each do
    @user = User.new(name: 'Ken', email: 'ken@ken.com', password: 'password',
                     password_confirmation: 'password').save
    visit user_session_path
  end
  context 'Page Content: ' do
    it 'contains button to "LOG IN"' do
      expect(page).to have_button 'LOG IN'
    end
  end
  context 'Page Function' do
    it 'show invalid login' do
      click_button 'LOG IN'
      expect(page).to have_content 'Invalid Email or password.'
    end
    it 'click the login success' do
      fill_in 'user_email', with: 'ken@ken.com'
      fill_in 'user_password', with: 'password'
      click_button 'LOG IN'
      expect(page).to have_content 'Signed in successfully'
    end
    it 'Login successfully' do
      fill_in 'user_email', with: 'ken@ken.com'
      fill_in 'user_password', with: 'password'
      click_button 'LOG IN'
      expect(page).to have_current_path(categories_path)
    end
  end
end
