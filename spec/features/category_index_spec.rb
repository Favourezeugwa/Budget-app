require 'rails_helper'

RSpec.describe 'Inventory index page', type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Favour',
      email: 'favour@gmail.com',
      password: '1234567'
    )

    Category.create(
      name: 'Category 1', 
      icon: 'http://fasfa-utensils', 
      description: 'Food expenses',  
      user_id: @user1.id
    )

    Category.create(
      name: 'Category 2', 
      icon: 'http://category2',
      description: 'Category 2 expenses', 
      user_id: @user1.id
    )
  end

  describe 'GET /categories' do
    it 'displays all categories' do
      visit categories_path
      expect(page).to have_content('Category 1')
      expect(page).to have_content('Category 2')
    end
  end
end