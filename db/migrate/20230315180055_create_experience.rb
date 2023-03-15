class CreateExperience < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.string :job_title
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
