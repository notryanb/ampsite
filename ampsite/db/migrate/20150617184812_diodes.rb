class Diodes < ActiveRecord::Migration
  def change
    create_table :diodes do |t|
      t.string :identifier, null: false
      t.float :max_peak_inverse_voltage
      t.float :voltage_drop
      t.string :rectifier_class
      t.float :rms_anode_to_anode
      t.float :filament_voltage
      t.float :filament_current
      t.string :pinout
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
