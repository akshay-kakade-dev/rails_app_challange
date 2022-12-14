class Product < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imagable
  validates :name, :manufacturer, :price, :category, presence: true
end
