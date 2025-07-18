class Product < ApplicationRecord

  validates :product_name, presence: true

  before_commit :super_size_types

  def super_size_types
    product_type = product_type.upcase!
  end
end
