class Triodepentodes < ActiveRecord::Migration
  def change
    create_table :triodepentodes do |t|
      t.string :identifier, null: false
      t.float :max_triode_anode_voltage, null: false
      t.float :max_pentode_anode_voltage, null: false
      t.float :max_pentode_grid2_voltage, null: false
      t.float :max_triode_anode_dissipation, null: false
      t.float :max_pentode_anode_dissipation, null: false

      t.float :filament_voltage,  null: false
      t.float :filament_current, null: false
      t.string :pinout
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
