class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: %i[show edit update destroy]

  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expense_categories.includes(:expense).map(&:expense)
  end
end
