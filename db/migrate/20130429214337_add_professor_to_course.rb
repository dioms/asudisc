class AddProfessorToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :professor, :string
  end
end
