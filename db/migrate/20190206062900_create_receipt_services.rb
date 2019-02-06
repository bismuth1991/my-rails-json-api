class CreateReceiptServices < ActiveRecord::Migration[5.2]
  def change
    create_table :receipt_services do |t|
      t.integer :receipt_id, null: false
      t.integer :service_id, null: false

      t.timestamps
    end

    add_index :receipt_services, :receipt_id
    add_index :receipt_services, :service_id
  end
end
