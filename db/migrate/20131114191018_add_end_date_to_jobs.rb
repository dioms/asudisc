class AddEndDateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :end_date, :date
  end
end
