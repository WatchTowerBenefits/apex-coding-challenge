class CreateProduct < ActiveRecord::Migration[7.2]

  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_type
      t.integer :count
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
