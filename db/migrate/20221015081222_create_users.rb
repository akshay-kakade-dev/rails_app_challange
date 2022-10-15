class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact_no
      t.string :city
      t.string :email
      t.string :type
      t.timestamps
    end
  end
end
