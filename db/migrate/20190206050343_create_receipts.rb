class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :technician_id, null: false
      t.boolean :case, default: false 

      t.timestamps
    end

    add_index :receipts, :technician_id
  end
end
