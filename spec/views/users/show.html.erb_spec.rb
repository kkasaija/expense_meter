require 'rails_helper'

RSpec.feature 'User Profile:', type: :feature do
  before :each do
    @user = User.new(name: 'Ken', email: 'ken@ken.com', password: 'password', password_confirmation: 'password')
    @user.save
    visit user_session_path
    fill_in 'user_email', with: 'ken@ken.com'
    fill_in 'user_password', with: 'password'
    click_button 'LOG IN'
    visit user_path(@user)
  end
  context 'Page Contents: ' do
    it 'can view user profile' do
      expect(page).to have_current_path(user_path(@user))
    end
    it 'contains user details' do
      expect(page).to have_content @user.name
      expect(page).to have_content @user.sign_in_count
    end
    it 'contains button to "LOG OUT"' do
      expect(page).to have_button 'LOG OUT'
    end
    it 'contains link to "VIEW BUDGETS"' do
      expect(page).to have_link 'VIEW BUDGETS'
    end
  end
  context 'Page Fuction:' do
    it 'click link to edit profile' do
      click_link 'EDIT PROFILE'
      expect(page).to have_current_path(edit_user_registration_path(@user))
    end
  end
end
