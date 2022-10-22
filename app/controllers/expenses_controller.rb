class ExpensesController < ApplicationController
  # before_action :set_expense, only: %i[show new create edit update destroy]

  before_action :authenticate_user!

  def index
    @expenses = Expense.all.order('expenses.created_at DESC')
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def edit; end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.save
        @category = ExpenseCategory.create(expense_id: @expense.id, category_id: expense_category_params[:category_id])
        @category.increment_total
        format.html { redirect_to category_expense_categories_path(@category.category_id), notice: 'Expense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to category_path(@expense.category_id), notice: 'expense was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.expense_categories.first.decrement_total
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to category_expense_categories_path(@expense), notice: 'Expense was successfully destroyed.' }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def expense_category_params
    params.require(:expense).permit(:category_id)
  end
end
