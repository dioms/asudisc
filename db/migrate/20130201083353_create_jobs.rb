class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :company_name
      t.string :city
      t.text :description
      t.text :requirements
      t.string :company_url
      t.text :company_description

      t.timestamps
    end
  end
end
