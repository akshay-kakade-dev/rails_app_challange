class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :max_mark
      t.string :language

      t.timestamps
    end
  end
end
