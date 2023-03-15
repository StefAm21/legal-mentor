class DropStudys < ActiveRecord::Migration[7.0]
  def change
    drop_table :studys
  end
end
