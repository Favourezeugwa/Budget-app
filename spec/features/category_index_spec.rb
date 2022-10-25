require 'rails_helper'

RSpec.describe 'Inventory index page', type: :feature do
  before :each do
    @user = User.create(
      name: 'John',
      email: 'john1@gmail.com',
      password: '1234567'
    )

    @category = @user.categories.create(
      name: 'Food',
      icon: 'http://fasfa-utensils',
      description: 'Food expenses',
      user_id: @user.id
    )

    visit(new_user_session_path)
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end

  describe 'GET /categories' do
    it 'displays all categories' do
      visit categories_path
      expect(page).to have_content('Food')
      expect(page).to have_content('http://fasfa-utensils')
      expect(page).to have_content('Add New category')
      expect(page).to have_content('Edit')
      expect(page).to have_content('Destroy')
    end

    it 'displays new category' do
      visit new_category_path
      expect(page).to have_content('Name')
      expect(page).to have_content('Icon')
      expect(page).to have_content('New category')
      expect(page).to have_content('Back to categories')
    end
  end
end
