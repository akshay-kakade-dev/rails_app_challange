class User < ApplicationRecord
  has_many :products
  has_one :image, as: :imagable
end
