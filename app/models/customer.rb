class Customer < ApplicationRecord
  has_many :orders
  has_many :goods, through: :orders
end
