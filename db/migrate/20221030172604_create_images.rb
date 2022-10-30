class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :imagable, polymorphic: true
      t.string :name
      t.integer :views
      t.timestamps
    end
  end
end
