class Tetrodes < ActiveRecord::Migration
  def change
    create_table :tetrodes do |t|
      t.string :identifier, null: false
      t.float :max_anode_voltage, null: false
      t.float :max_grid2_voltage, null: false
      t.float :max_anode_dissipation, null: false
      t.float :max_grid2_dissipation, null: false
      t.float :max_cathode_current, null: false

      t.float :filament_voltage,  null: false
      t.float :filament_current, null: false
      t.string :pinout
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
