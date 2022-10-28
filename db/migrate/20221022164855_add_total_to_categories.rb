class AddTotalToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :total, :decimal, default: 0
  end
end
