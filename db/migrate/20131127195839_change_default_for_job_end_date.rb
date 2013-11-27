class ChangeDefaultForJobEndDate < ActiveRecord::Migration
  def up
    change_column :jobs, :end_date, :date, default: 60.days.from_now
  end

  def down
  end
end
