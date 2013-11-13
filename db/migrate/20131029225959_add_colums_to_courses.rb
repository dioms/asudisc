class AddColumsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :name, :string
    add_column :courses, :start, :string
  end
end
