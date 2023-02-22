class UsersController < ApplicationController
  def show
    @user = current_user
    @total_categories = current_user.categories.size
    @total_expenses = calculate_total
  end
end