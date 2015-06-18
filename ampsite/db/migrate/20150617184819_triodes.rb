class Triodes < ActiveRecord::Migration
  def change
    create_table :triodes do |t|
      t.string :identifier, null: false

      t.float :max_anode_voltage
      t.float :max_filament_cathode_voltage
      t.float :max_cathode_current
      t.float :anode_dissipation
      t.float :amplification_factor
      
      t.float :filament_voltage
      t.float :filament_current
      t.string :pinout
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
