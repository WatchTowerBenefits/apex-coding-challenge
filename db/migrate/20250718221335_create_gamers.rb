class CreateGamers < ActiveRecord::Migration[7.1]
  def change
    create_table :gamers do |t|
      t.string :name
      t.string :description
      t.integer :age

      t.timestamps
    end
  end
end
