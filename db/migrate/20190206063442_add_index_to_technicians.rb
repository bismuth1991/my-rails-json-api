class AddIndexToTechnicians < ActiveRecord::Migration[5.2]
  def change
    add_index :technicians, :name, unique: true
  end
end
