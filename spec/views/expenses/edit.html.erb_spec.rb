require 'rails_helper'

RSpec.feature 'Expense/edit.html.erb', type: :feature do
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
    @expense = Expense.new(name: 'Test Expense', amount: 5)
    @expense.user = @user
    @expense.save
    visit edit_expense_path(@expense)
  end

  context 'Page Contents: ' do
    it 'can view Expense creation page' do
      expect(page).to have_current_path(edit_expense_path(@expense))
    end
  end

  context 'Page Function:' do
    it 'click link to "BACK TO CATEGORY"' do
      visit categories_path
      visit edit_expense_path(@expense)
      click_link 'BACK TO CATEGORY'
      expect(page).to have_current_path(edit_expense_path(@expense))
    end
  end
end
