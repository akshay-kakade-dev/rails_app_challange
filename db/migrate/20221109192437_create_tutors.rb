class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :contact_no
      t.string :education
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
