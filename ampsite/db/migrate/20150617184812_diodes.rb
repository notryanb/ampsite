class Diodes < ActiveRecord::Migration
  def change
    create_table :diodes do |t|
      t.string :identifier, null: false
      t.float :max_peak_inverse_voltage, null: false
      t.float :voltage_drop, null: false
      t.string :rectifier_class, null: false
      
      t.float :filament_voltage,  null: false
      t.float :filament_current, null: false
      t.string :pinout
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
