require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.new(name: 'Ken', email: 'ken@ken.com', password: 'password', password_confirmation: 'password')
  end

  describe 'GET /splash' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get root_path
      expect(response.body).to include('Expense Meter')
    end
  end
end
