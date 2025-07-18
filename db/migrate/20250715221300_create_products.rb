class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_type
      t.integer :count

      t.timestamps
    end
  end
end
