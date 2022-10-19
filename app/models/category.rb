class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, foreign_key: "category_id", dependent: :destroy, through: :expense_categories
  has_many :expense_categories, foreign_key: "category_id", dependent: :destroy

  validates :name , presence: true, length: { in: 3..20  }

end
