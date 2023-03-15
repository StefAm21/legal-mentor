class AddReferenceToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :payment, null: true, foreign_key: true
  end
end
