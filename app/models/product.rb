class Product < ApplicationRecord
  belongs_to :user

  validates :name, :manufacturer, :price, :category, presence: true
end
