class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :subject
      t.integer :number
      t.string :semester

      t.timestamps
    end
  end
end
