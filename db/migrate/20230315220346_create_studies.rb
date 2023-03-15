class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.string :title
      t.string :university
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
