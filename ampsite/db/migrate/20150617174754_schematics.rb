class Schematics < ActiveRecord::Migration
  def change
    create_table :schematics do |t|
      t.string :url
      t.references :ampmodel, null: false

      t.timestamps
    end
  end
end
