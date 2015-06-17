class Datasheets < ActiveRecord::Migration
  def change
    create_table :datasheets do |t|
      t.string :url
      t.references :tube, null: false

      t.timestamps
    end
  end
end
