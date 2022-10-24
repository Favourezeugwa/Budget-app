class Category < ApplicationRecord
  belongs_to :user
  has_many :expense_categories, foreign_key: 'category_id', dependent: :destroy
  has_many :expenses, through: :expense_categories, foreign_key: 'category_id', dependent: :destroy

  validates :name, presence: true, length: { in: 3..20 }
  validates :icon, presence: true
end
