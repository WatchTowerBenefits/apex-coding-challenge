class AddPriceAndImageUrlToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :price, :decimal, precision: 8, scale: 2
    add_column :products, :image_url, :string
  end
end
