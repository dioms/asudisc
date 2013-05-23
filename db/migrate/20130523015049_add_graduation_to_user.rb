class AddGraduationToUser < ActiveRecord::Migration
  def change
    add_column :users, :graduation, :string
  end
end
