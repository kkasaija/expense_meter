require 'rails_helper'

RSpec.feature 'Category Page:', type: :feature do
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
    visit category_path(@category)
  end

  context 'Page Contents: ' do
    it 'contains Category details "name"' do
      expect(page).to have_content @category.name
    end
    it 'contains link to "NEW TRANSACTION"' do
      expect(page).to have_link 'NEW TRANSACTION'
    end
  end
  context 'Page Function:' do
    it 'click link to create transaction' do
      click_link 'NEW TRANSACTION'
      expect(page).to have_current_path(new_expense_path)
    end
    it 'click button to "EDIT"' do
      click_button 'EDIT'
      expect(page).to have_current_path(edit_category_path(@category))
    end
  end
end
