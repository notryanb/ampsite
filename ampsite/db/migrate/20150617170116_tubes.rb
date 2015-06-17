class Tubes < ActiveRecord::Migration
  def change
    create_table :tubes do |t|
      t.string :type, null: false
      t.string :identifier, null: false
      t.string :socket, null: false
      t.integer :filament_voltage, null: false
      t.integer :filament_current, null: false
      t.integer :max_anode_voltage
      t.integer :max_anode_dissipation
      t.integer :max_grid_2_voltage
      t.integer :max_heater_to_cathode_voltage


      t.timestamps
    end
  end
end
