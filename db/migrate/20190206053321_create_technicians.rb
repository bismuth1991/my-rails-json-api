class CreateTechnicians < ActiveRecord::Migration[5.2]
  def change
    create_table :technicians do |t|
      t.string :name, null: false
      t.string :pin_number, null: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end