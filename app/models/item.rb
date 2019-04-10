class Item < ApplicationRecord
  belongs_to :shop
  has_many :orders
  has_many :customers, through: :orders
end
