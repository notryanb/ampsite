class Diodes < ActiveRecord::Migration
  def change
    create_table :diodes do |t|
      t.string :identifier, null: false
      t.string :classification, null: false
      t.string :filament_voltage, null: false
      t.string :filament_current, null: false
      t.string :max_peak_inverse_voltage, null: false
      t.string :voltage_drop, null: false

      t.timestamps
    end
  end
end
