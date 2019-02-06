class ChangeTechnicianPinNumberToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :technicians, :pin_number, "integer USING CAST(pin_number AS integer)"
  end
end
