class Pentodes < ActiveRecord::Migration
  def change
    create_table :pentodes do |t|
      t.string :identifier
      t.float :max_anode_voltage
      t.float :max_grid2_voltage
      t.float :max_anode_dissipation
      t.float :max_grid2_dissipation
      t.float :max_cathode_current
      t.float :filament_voltage
      t.float :filament_current
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
