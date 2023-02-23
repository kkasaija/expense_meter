require 'rails_helper'

RSpec.feature 'Category Edit Page:', type: :feature do
  before :each do
    @user = User.new(name: 'Ken', email: 'ken@ken.com', password: 'password', password_confirmation: 'password')
    @user.save
    visit user_session_path
    fill_in 'user_email', with: 'ken@ken.com'
    fill_in 'user_password', with: 'password'
    click_button 'LOG IN'
    @category = Category.new(name: 'Test Category', icon: 'icon.url')
    @category.user = @user
    @category.save
    visit edit_category_path(@category)
  end

  context 'Page Contents: ' do
    it 'can view Category editing page' do
      expect(page).to have_current_path(edit_category_path(@category))
    end

    it 'contains button to "UPDATE CATEGORY"' do
      expect(page).to have_button 'UPDATE CATEGORY'
    end
  end

  context 'Page Function:' do
    it 'click link to "BACK TO CATEGORY"' do
      visit categories_path
      visit new_category_path
      click_link 'BACK TO CATEGORY'
      expect(page).to have_current_path(new_category_path)
    end
  end
end
