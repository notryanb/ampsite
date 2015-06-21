class Triodepentodes < ActiveRecord::Migration
  def change
    create_table :triodepentodes do |t|
      t.string :identifier
      t.float :max_triode_anode_voltage
      t.float :max_pentode_anode_voltage
      t.float :max_pentode_grid2_voltage
      t.float :max_triode_anode_dissipation
      t.float :max_pentode_anode_dissipation
      t.float :filament_voltage
      t.float :filament_current
      t.string :pinout
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
