require 'rails_helper'

RSpec.describe Category, type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) do
    User.create(
      name: 'John',
      email: 'john1@gmail.com',
      password: '1234567'
    )
  end

  let(:category) do
    user.categories.create(
      name: 'Food',
      icon: 'http://fasfa-utensils',
      description: 'Food expenses',
      user_id: user.id
    )
  end

  describe 'GET /categories' do
    before do
      sign_in user
      get categories_path
    end

    it 'returns all categories' do
      get '/categories'
      expect(response).to have_http_status(200)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /categories' do
    before do
      sign_in user
      get new_category_path
    end

    it 'returns new category' do
      get '/categories/new'
      expect(response).to have_http_status(200)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
