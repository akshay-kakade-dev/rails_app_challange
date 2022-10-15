class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :users, null: false, foreign_key: true
      t.string :category
      t.string :price
      t.string :name
      t.string :manufacturer
      t.timestamps
    end
  end
end
