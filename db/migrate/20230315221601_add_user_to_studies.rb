class AddUserToStudies < ActiveRecord::Migration[7.0]
  def change
    add_reference :studies, :user, null: false, foreign_key: true
  end
end
