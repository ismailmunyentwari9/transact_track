class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :transactions_list, class_name: 'Transaction'
end
