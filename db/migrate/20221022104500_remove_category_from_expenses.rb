class RemoveCategoryFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_reference :expenses, :category, null: false, foreign_key: true
  end
end
