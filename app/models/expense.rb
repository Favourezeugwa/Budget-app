class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_categories, foreign_key: 'expense_id', dependent: :destroy
  has_many :categories, through: :expense_categories, foreign_key: 'expense_id'

  validates :name, presence: true, length: { in: 3..20 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
