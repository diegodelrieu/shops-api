class Shop < ApplicationRecord
  has_many :items
  has_many :orders, through: :goods
end
